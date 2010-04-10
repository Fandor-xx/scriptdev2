/* Copyright (C) 2006 - 2009 ScriptDev2 <https://scriptdev2.svn.sourceforge.net/>
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
 */

/* ScriptData
SDName: Boss_Majordomo_Executus
SD%Complete: 90
SDComment: Often workaround spells
SDCategory: Molten Core
EndScriptData */

#include "precompiled.h"
#include "molten_core.h"

#define SAY_AGGRO           -1409003
#define SAY_SPAWN           -1409004
#define SAY_SLAY            -1409005
#define SAY_SPECIAL         -1409006
#define SAY_DEFEAT          -1409007

#define SAY_SUMMON_MAJ      -1409008
#define SAY_ARRIVAL1_RAG    -1409009
#define SAY_ARRIVAL2_MAJ    -1409010
#define SAY_ARRIVAL3_RAG    -1409011
#define SAY_ARRIVAL5_RAG    -1409012

#define SPAWN_RAG_X         838.51f
#define SPAWN_RAG_Y         -829.84f
#define SPAWN_RAG_Z         -232.00f
#define SPAWN_RAG_O         1.70f

#define SPELL_MAGIC_REFLECTION      35158 // Spell workaround - 20619
#define SPELL_DAMAGE_REFLECTION     35159 // Spell workaround - 21075
#define SPELL_BLASTWAVE             20229
#define SPELL_AEGIS                 20620                   //This is self casted whenever we are below 50%
#define SPELL_TELEPORT              20618
#define SPELL_SUMMON_RAGNAROS       19774
#define SPELL_FLAME_AURA			58579

#define ENTRY_FLAMEWALKER_HEALER    11663
#define ENTRY_FLAMEWALKER_ELITE     11664

#define CENTER_X 120.148811f
#define CENTER_Y 703.713684f
#define CENTER_Z 45.111477f

#define FRIENDLY_FACTION				35

#define END_X 753.690430f
#define END_Y -1179.973389f
#define END_Z -118.373444f
#define END_O 2.695165f

static double POS_X[8] = {764.333252, 761.579590, 759.106323, 756.124023, 772.586975, 776.704895, 779.419373, 783.828613};
static double POS_Y[8] = {-1215.194946, -1222.640015, -1228.976318, -1237.590698, -1199.444336, -1194.604248, -1189.251953, -1181.874634};
static double POS_Z[8] = {-119.759811, -120.066162, -119.239403, -119.537369, -119.714180, -119.977524, -120.175232, -120.492287};
static double ORIENT[8] = {2.787323, 2.743341, 2.743341, 2.617677, 2.529712, 2.592544, 2.677367, 2.803031};

static uint32 GameObjectEntry = 179703;

static uint32 AddEntryList[8]=
{
    11663,
    11663,
	11663,
	11663,
	11664,
	11664,
	11664,
	11664
};

struct MANGOS_DLL_DECL boss_majordomoAI : public ScriptedAI
{
    boss_majordomoAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        m_pInstance = (ScriptedInstance*)pCreature->GetInstanceData();
		SelectAddEntry();
        for(uint8 i = 0; i < 8; ++i)
            AddGUID[i] = 0;
			
		Reset();
    }

    ScriptedInstance* m_pInstance;

	uint64 AddGUID[8];
    uint32 AddEntry[8];
    uint32 Reflection_Timer;
    uint32 Blastwave_Timer;
	uint32 Teleport_Timer;
	uint32 Teleport_self_Timer;
	Creature* adds[8];
	uint32 Dead_adds;
	uint32 Say_defeat_Timer;
	Unit* auraTarget;
	uint32 Aura_Timer;

    void Reset()
    {
        Reflection_Timer = 25000;                     //Damage reflection first so we alternate
        Blastwave_Timer = 10000;
		Teleport_Timer = 20000;
		Dead_adds = 0;
		Say_defeat_Timer = 0;
		Aura_Timer = 21000;

		SpawnAdds();
    }

    void KilledUnit(Unit* victim)
    {
        if (urand(0, 4))
            return;

        DoScriptText(SAY_SLAY, m_creature);
    }

	void SpawnAdds()
    {
        for(uint8 i = 0; i < 8; ++i)
        {
            Creature *pCreature = ((Creature*)Unit::GetUnit((*m_creature), AddGUID[i]));
            if(!pCreature || !pCreature->isAlive())
            {
                if(pCreature) pCreature->setDeathState(DEAD);
                pCreature = m_creature->SummonCreature(AddEntry[i], POS_X[i], POS_Y[i], POS_Z[i], ORIENT[i], TEMPSUMMON_DEAD_DESPAWN, 0);
                if(pCreature) AddGUID[i] = pCreature->GetGUID();
            }
            else
            {
                pCreature->AI()->EnterEvadeMode();
                pCreature->Relocate(POS_X[i], POS_Y[i], POS_Z[i], ORIENT[i]);
                pCreature->StopMoving();
            }
			
			adds[i] = pCreature;
		}
    }

	void SelectAddEntry()
    {
        std::vector<uint32> AddList;
        
        for(uint8 i = 0; i < 8; ++i)
            AddList.push_back(AddEntryList[i]);
        
         uint8 i = 0;
        while(AddList.size() > 8)
        {
            AddList.erase(AddList.begin()+i);
            i++;
        }

        i=0;

        for(std::vector<uint32>::iterator itr = AddList.begin(); itr != AddList.end(); ++itr, ++i)
            AddEntry[i] = *itr;
    }

	void CastShield()
	{
		int randomShield = urand(0, 1);
		if (randomShield == 0)
		{
			//Cast MagicReflection
			DoCast(m_creature, SPELL_MAGIC_REFLECTION);
		}
		else
		{
			//Cast DamageShield
			DoCast(m_creature, SPELL_DAMAGE_REFLECTION);
		}
	}

    void Aggro(Unit *who)
    {
		if (m_pInstance)
			m_pInstance->SetData(DATA_MAJORDOMO, IN_PROGRESS);

        DoScriptText(SAY_AGGRO, m_creature);

		for(uint8 i = 0; i < 8; ++i)
        {
            Unit* Temp = Unit::GetUnit((*m_creature),AddGUID[i]);
            if(Temp && Temp->isAlive())
                ((Creature*)Temp)->AI()->AttackStart(m_creature->getVictim());
            else
            {
                //EnterEvadeMode();
                break;
            }
        }
    }

	void GetFriendly()
	{
		m_creature->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
		m_creature->setFaction(FRIENDLY_FACTION);
		m_creature->Relocate(END_X, END_Y, END_Z, END_O);
		m_creature->SendMonsterMove(END_X, END_Y, END_Z, SPLINETYPE_NORMAL, SPLINEFLAG_WALKMODE, 1000);
		m_creature->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_IN_COMBAT);
	}

    void UpdateAI(const uint32 diff)
    {
        if (!m_creature->SelectHostileTarget() || !m_creature->getVictim())
            return;
		
		if (!adds[0]->isAlive())
			if (!adds[1]->isAlive())
				if (!adds[2]->isAlive())
					if (!adds[3]->isAlive())
						if (!adds[4]->isAlive())
							if (!adds[5]->isAlive())
								if (!adds[6]->isAlive())
									if (!adds[7]->isAlive())
									{
										GetFriendly();
										
										if (Say_defeat_Timer < diff)
										{	
											DoScriptText(SAY_DEFEAT, m_creature);
											Say_defeat_Timer = 4294967295;
											
											
										}else Say_defeat_Timer -= diff;

										if (Teleport_self_Timer < diff)
										{
											DoCast(m_creature, SPELL_TELEPORT);
											m_creature->SetVisibility(VISIBILITY_OFF);
											m_creature->setDeathState(JUST_DIED);
											m_pInstance->SetData(DATA_MAJORDOMO, DONE);
																											
											Teleport_self_Timer = 4294967295;

											m_creature->SummonCreature(11502, 836.980042f, -832.665222f, -232.000001f, 0, TEMPSUMMON_CORPSE_TIMED_DESPAWN, 99999999);
											
										}else Teleport_self_Timer -= diff;

									}
									
		if (!m_creature->HasFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE))
		{
		
			Teleport_self_Timer = 40000;
			Say_defeat_Timer = 2000;

			//Cast Ageis if less than 50% hp
			if (m_creature->GetHealth()*100 / m_creature->GetMaxHealth() < 50)
			{
				DoCast(m_creature, SPELL_AEGIS);
			}

			if (Reflection_Timer < diff)
			{
				//random shield cast
				CastShield();
				Reflection_Timer = 25000;
			}else Reflection_Timer -= diff;

			if (Teleport_Timer < diff)
			{
				//Teleport to middle
				if(Unit* pTarget = SelectUnit(SELECT_TARGET_RANDOM, 0))
				{
					if (pTarget)
					{
						DoCast(pTarget, SPELL_TELEPORT);
						DoTeleportPlayer(pTarget, 735.580322f,-1175.523804f,-119.220230f,5.683450f);
						auraTarget = pTarget;
					}
				}
				Teleport_Timer = 20000;
			}else Teleport_Timer -= diff;

			if (Aura_Timer < diff)
			{
				DoCast(auraTarget, SPELL_FLAME_AURA);
				Aura_Timer = Teleport_Timer + 1000;

			}else Aura_Timer -= diff;
	        
			if (Blastwave_Timer < diff)
			{
				DoCast(m_creature->getVictim(),SPELL_BLASTWAVE);
				Blastwave_Timer = 10000;
			}else Blastwave_Timer -= diff;

			DoMeleeAttackIfReady();
			}
		else
		{
			return;
		}
	}
 
};

struct MANGOS_DLL_DECL boss_majordomo_addAI : public ScriptedAI
{
    ScriptedInstance* pInstance;
	
	
	
    boss_majordomo_addAI(Creature* c) : ScriptedAI(c)
    {
        pInstance = ((ScriptedInstance*)c->GetInstanceData());
        Reset();
    }

    void Reset() {}
    void Aggro(Unit* who) {}
    void JustDied(Unit* killer)
	{
		if(!pInstance)
            return;
	}

    void UpdateAI(const uint32 diff)
    {
		// Seems as there is no IN_PROGRESS data. Creatures stays always in EnterEvadeMode.
		// if(pInstance && pInstance->GetData(DATA_MAJORDOMO) != IN_PROGRESS)
        //    EnterEvadeMode();
		
		DoMeleeAttackIfReady();
    }
};

#define SPELL_BLAST_WAVE    20229
#define SPELL_FIREPUNCH		20623

struct MANGOS_DLL_DECL boss_eliteAI : public boss_majordomo_addAI
{

    boss_eliteAI(Creature *c) : boss_majordomo_addAI(c) {}
	
	uint32 Shield_timer_elite;
	uint32 Blast_wave_timer;
	uint32 Firepunch_timer;

    void Reset()
    {	
		Firepunch_timer = 10000;
		Blast_wave_timer = 12000;
		Shield_timer_elite = 25000;
		boss_majordomo_addAI::Reset();
    }
	
	void CastShield()
	{
		int randomShield = urand(0, 1);
		if (randomShield == 0)
		{
			//Cast MagicReflection
			DoCast(m_creature, SPELL_MAGIC_REFLECTION);
		}
		else
		{
			//Cast DamageShield
			DoCast(m_creature, SPELL_DAMAGE_REFLECTION);
		}
	}

    void UpdateAI(const uint32 diff)
    {
        if(!m_creature->SelectHostileTarget() || !m_creature->getVictim() )
            return;
		
		if (Firepunch_timer < diff)
		{
			DoCast(m_creature->getVictim(), SPELL_FIREPUNCH);
			Firepunch_timer = 10000;
		}else Firepunch_timer -=diff;
		
		if (Blast_wave_timer < diff)
        {
            DoCast(m_creature->getVictim(),SPELL_BLAST_WAVE);
            Blast_wave_timer = 12000;
        }else Blast_wave_timer -= diff;

		if (Shield_timer_elite < diff)
		{
			//random shield cast
			CastShield();
			Shield_timer_elite = 25000;
		}else Shield_timer_elite -= diff;	

        boss_majordomo_addAI::UpdateAI(diff);
    }
};

#define SPELL_SHADOW_SHOCK    20603

struct MANGOS_DLL_DECL boss_healerAI : public boss_majordomo_addAI
{

    boss_healerAI(Creature *c) : boss_majordomo_addAI(c) {}

	uint32 Shield_timer_healer;
	uint32 Shadow_shock_timer;

    void Reset()
    {
		Shield_timer_healer = 25000;
		Shadow_shock_timer = 10000;
		boss_majordomo_addAI::Reset();
    }
	
	void CastShield()
	{
		int randomShield = urand(0, 1);
		if (randomShield == 0)
		{
			//Cast MagicReflection
			DoCast(m_creature, SPELL_MAGIC_REFLECTION);
		}
		else
		{
			//Cast DamageShield
			DoCast(m_creature, SPELL_DAMAGE_REFLECTION);
		}
	}

    void UpdateAI(const uint32 diff)
    {
        if(!m_creature->SelectHostileTarget() || !m_creature->getVictim() )
            return;

		if (Shadow_shock_timer < diff)
		{
			DoCast(m_creature->getVictim(), SPELL_SHADOW_SHOCK);
			Shadow_shock_timer = 10000;
		}else Shadow_shock_timer -= diff;

		if (Shield_timer_healer < diff)
		{
			//random shield cast
			CastShield();
			Shield_timer_healer = 25000;
		}else Shield_timer_healer -= diff;

        boss_majordomo_addAI::UpdateAI(diff);
    }
};

CreatureAI* GetAI_boss_majordomo(Creature* pCreature)
{
    return new boss_majordomoAI(pCreature);
}

CreatureAI* GetAI_boss_healer(Creature* pCreature)
{
    return new boss_healerAI(pCreature);
}

CreatureAI* GetAI_boss_elite(Creature *_Creature)
{
    return new boss_eliteAI (_Creature);
}

void AddSC_boss_majordomo()
{
    Script *newscript;
    newscript = new Script;
    newscript->Name = "boss_majordomo";
    newscript->GetAI = &GetAI_boss_majordomo;
    newscript->RegisterSelf();
	
	newscript = new Script;
    newscript->Name = "boss_elite";
    newscript->GetAI = &GetAI_boss_elite;
    newscript->RegisterSelf();
	
	newscript = new Script;
    newscript->Name = "boss_healer";
    newscript->GetAI = &GetAI_boss_healer;
    newscript->RegisterSelf();
}
