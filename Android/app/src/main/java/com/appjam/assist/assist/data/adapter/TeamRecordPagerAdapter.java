package com.appjam.assist.assist.data.adapter;

import android.support.v4.app.Fragment;
import android.support.v4.app.FragmentManager;
import android.support.v4.app.FragmentStatePagerAdapter;

import com.appjam.assist.assist.data.ViewPagerFragment.TeamRecordFirstFragment;
import com.appjam.assist.assist.data.ViewPagerFragment.TeamRecordFourthFragment;
import com.appjam.assist.assist.data.ViewPagerFragment.TeamRecordSecondFragment;
import com.appjam.assist.assist.data.ViewPagerFragment.TeamRecordThirdFragment;
import com.appjam.assist.assist.model.response.AssistRank;
import com.appjam.assist.assist.model.response.ScoreRank;
import com.appjam.assist.assist.model.response.Tactic;
import com.appjam.assist.assist.model.response.TeamMonth;
import com.appjam.assist.assist.model.response.TeamPlay;

import java.util.ArrayList;

/**
 * Created by gominju on 2017. 6. 29..
 */

public class TeamRecordPagerAdapter extends FragmentStatePagerAdapter {

    private ArrayList<TeamPlay> teamPlay;
    private ArrayList<TeamMonth> monthList;
    private ArrayList<Tactic> tacticList;
    private ArrayList<ScoreRank> scoreRank;
    private ArrayList<AssistRank> assistRank;

    public TeamRecordPagerAdapter(FragmentManager fm) {
        super(fm);
    }

    public void setFirstData(ArrayList<TeamPlay> teamPlay) {
        this.teamPlay = teamPlay;
    }

    public void setSecondData(ArrayList<TeamMonth> monthList) {
        this.monthList = monthList;
    }

    public void setThirdData(ArrayList<Tactic> tacticList) {
        this.tacticList = tacticList;
    }

    public void setFrouthData(ArrayList<ScoreRank> scoreRank, ArrayList<AssistRank> assistRank) {
        this.scoreRank = scoreRank;
        this.assistRank = assistRank;
    }

    @Override
    public Fragment getItem(int position) {
        switch (position) {
            case 0:
                TeamRecordFirstFragment fragment1 = new TeamRecordFirstFragment().newInstance(teamPlay);
                return fragment1;
            case 1:
                TeamRecordSecondFragment fragment2 = new TeamRecordSecondFragment().newInstance(monthList);
                return fragment2;
            case 2:
                TeamRecordThirdFragment fragment3 = new TeamRecordThirdFragment().newInstance(tacticList);
                return fragment3;
            case 3:
                TeamRecordFourthFragment fragment4 = new TeamRecordFourthFragment().newInstance(scoreRank, assistRank);
                return fragment4;
            default:
                return null;
        }
    }

    @Override
    public int getCount() {
        return 4;
    }
}
