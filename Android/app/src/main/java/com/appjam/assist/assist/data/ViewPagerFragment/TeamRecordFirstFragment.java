package com.appjam.assist.assist.data.ViewPagerFragment;

import android.content.SharedPreferences;
import android.os.Bundle;
import android.preference.PreferenceManager;
import android.support.annotation.Nullable;
import android.support.v4.app.Fragment;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import android.widget.ImageView;
import android.widget.TextView;

import com.appjam.assist.assist.BaseActivity;
import com.appjam.assist.assist.R;
import com.appjam.assist.assist.model.response.TeamPlay;
import com.appjam.assist.assist.model.response.TeamPlayResult;
import com.appjam.assist.assist.network.ApplicationController;
import com.appjam.assist.assist.network.NetworkService;

import java.io.IOException;
import java.util.ArrayList;

import retrofit2.Call;
import retrofit2.Callback;
import retrofit2.Response;

/**
 * Created by gominju on 2017. 6. 29..
 */

public class TeamRecordFirstFragment extends Fragment {
    private View v;
    private ImageView iv_result2, iv_result3, iv_result4, iv_result5;
    private TextView tv_result1, tv_date1, tv_date2, tv_date3, tv_date4, tv_date5, tv_score1, tv_score2, tv_score3, tv_score4, tv_score5;
    private FrameLayout iv_result1;
    private NetworkService networkService;
    private int team_id;
    private ArrayList<TeamPlay> teamPlay;

    public TeamRecordFirstFragment newInstance(ArrayList<TeamPlay> teamPlay) {
        TeamRecordFirstFragment fragment = new TeamRecordFirstFragment();
        this.teamPlay = teamPlay;

        Bundle bundle = new Bundle();
        bundle.putSerializable("data", teamPlay);

        fragment.setArguments(bundle);
        return fragment;
    }


    @Nullable
    @Override
    public View onCreateView(LayoutInflater inflater, @Nullable ViewGroup container, @Nullable Bundle savedInstanceState) {
        v = inflater.inflate(R.layout.vp_team_first, container, false);
        BaseActivity.setGlobalFont(getContext(), getActivity().getWindow().getDecorView());

        teamPlay = (ArrayList<TeamPlay>)getArguments().getSerializable("data");

        SharedPreferences preferences = PreferenceManager.getDefaultSharedPreferences(getContext());
        team_id = preferences.getInt("team_id", 0);
        initView();
//        initNetwork();
        return v;
    }

    private void initNetwork() {
        networkService = ApplicationController.getInstance().getNetworkService();

        final Call<TeamPlayResult> result = networkService.getTeamPlayList(team_id);
        result.enqueue(new Callback<TeamPlayResult>() {
            @Override
            public void onResponse(Call<TeamPlayResult> call, Response<TeamPlayResult> response) {
                if (response.isSuccessful()) {
                    teamPlay = response.body().response;
                    setData(teamPlay);
                }
            }

            @Override
            public void onFailure(Call<TeamPlayResult> call, Throwable t) {

            }
        });

    }

    public void setData(ArrayList<TeamPlay> teamPlay) {
        int play_num = teamPlay.size();
        Log.i("mytag", "play_num.size : " + play_num);
        boolean p1 = false, p2 = false, p3 = false, p4 = false, p5 = false;

        switch (play_num) {
            case 0:
                break;
            case 1:
                p1 = true;
                break;
            case 2:
                p1 = true;
                p2 = true;
                break;
            case 3:
                p1 = true;
                p2 = true;
                p3 = true;
                break;
            case 4:
                p1 = true;
                p2 = true;
                p3 = true;
                p4 = true;
                break;
            case 5:
                p1 = true;
                p2 = true;
                p3 = true;
                p4 = true;
                p5 = true;
                break;
            default:
                break;
        }
        if (p1) {
            int num_win1 = teamPlay.get(0).getScore_team();
            int num_lose1 = teamPlay.get(0).getScore_against_team();
            if (num_win1 > num_lose1) {
                tv_result1.setText("승");
                iv_result1.setBackgroundResource(R.drawable.oval_pink);
            } else if (num_win1 < num_lose1) {
                tv_result1.setText("패");
                iv_result1.setBackgroundResource(R.drawable.oval_skyblue);
            } else {
                tv_result1.setText("무");
                iv_result1.setBackgroundResource(R.drawable.oval_gray);
            }
            String date1 = teamPlay.get(0).getGame_dt().substring(5, 7) + "월 " + teamPlay.get(0).getGame_dt().substring(8, 10) + "일";
            tv_date1.setText(date1);
            tv_score1.setText(num_win1 + " : " + num_lose1);
        } else {
            iv_result1.setBackgroundResource(R.drawable.oval_navy);
            tv_result1.setText("-");
            tv_date1.setText("");
            tv_score1.setText("- : -");
        }

        if (p2) {
            int num_win2 = teamPlay.get(1).getScore_team();
            int num_lose2 = teamPlay.get(1).getScore_against_team();
            if (num_win2 > num_lose2) {
                iv_result2.setBackgroundResource(R.drawable.oval_pink);
            } else if (num_win2 < num_lose2) {
                iv_result2.setBackgroundResource(R.drawable.oval_skyblue);
            } else {
                iv_result2.setBackgroundResource(R.drawable.oval_gray);
            }
            String date2 = teamPlay.get(1).getGame_dt().substring(5, 7) + "월 " + teamPlay.get(1).getGame_dt().substring(8, 10) + "일";
            tv_date2.setText(date2);
            tv_score2.setText(num_win2 + " : " + num_lose2);
        } else {
            iv_result2.setBackgroundResource(R.drawable.oval_navy);
            tv_date2.setText("");
            tv_score2.setText("- : -");
        }

        if (p3) {
            int num_win3 = teamPlay.get(2).getScore_team();
            int num_lose3 = teamPlay.get(2).getScore_against_team();
            if (num_win3 > num_lose3) {
                iv_result3.setBackgroundResource(R.drawable.oval_pink);
            } else if (num_win3 < num_lose3) {
                iv_result3.setBackgroundResource(R.drawable.oval_skyblue);
            } else {
                iv_result3.setBackgroundResource(R.drawable.oval_gray);
            }
            String date3 = teamPlay.get(2).getGame_dt().substring(5, 7) + "월 " + teamPlay.get(2).getGame_dt().substring(8, 10) + "일";
            tv_date3.setText(date3);
            tv_score3.setText(num_win3 + " : " + num_lose3);
        } else {
            iv_result3.setBackgroundResource(R.drawable.oval_navy);
            tv_date3.setText("");
            tv_score3.setText("- : -");
        }


        if (p4) {
            int num_win4 = teamPlay.get(3).getScore_team();
            int num_lose4 = teamPlay.get(3).getScore_against_team();
            if (num_win4 > num_lose4) {
                iv_result4.setBackgroundResource(R.drawable.oval_pink);
            } else if (num_win4 < num_lose4) {
                iv_result4.setBackgroundResource(R.drawable.oval_skyblue);
            } else {
                iv_result4.setBackgroundResource(R.drawable.oval_gray);
            }
            String date4 = teamPlay.get(3).getGame_dt().substring(5, 7) + "월 " + teamPlay.get(3).getGame_dt().substring(8, 10) + "일";
            tv_date4.setText(date4);
            tv_score4.setText(num_win4 + " : " + num_lose4);
        } else {
            iv_result4.setBackgroundResource(R.drawable.oval_navy);
            tv_date4.setText("");
            tv_score4.setText("- : -");
        }

        if (p5) {
            int num_win5 = teamPlay.get(4).getScore_team();
            int num_lose5 = teamPlay.get(4).getScore_against_team();
            if (num_win5 > num_lose5) {
                iv_result5.setBackgroundResource(R.drawable.oval_pink);
            } else if (num_win5 < num_lose5) {
                iv_result5.setBackgroundResource(R.drawable.oval_skyblue);
            } else {
                iv_result5.setBackgroundResource(R.drawable.oval_gray);
            }
            String date5 = teamPlay.get(4).getGame_dt().substring(5, 7) + "월 " + teamPlay.get(4).getGame_dt().substring(8, 10) + "일";
            tv_date5.setText(date5);
            tv_score5.setText(num_win5 + " : " + num_lose5);
        } else {
            iv_result5.setBackgroundResource(R.drawable.oval_navy);
            tv_date5.setText("");
            tv_score5.setText("- : -");
        }
    }

    private void initView() {
        iv_result1 = (FrameLayout) v.findViewById(R.id.iv_result1);
        iv_result2 = (ImageView) v.findViewById(R.id.iv_result2);
        iv_result3 = (ImageView) v.findViewById(R.id.iv_result3);
        iv_result4 = (ImageView) v.findViewById(R.id.iv_result4);
        iv_result5 = (ImageView) v.findViewById(R.id.iv_result5);
        tv_result1 = (TextView) v.findViewById(R.id.tv_result1);
        tv_date1 = (TextView) v.findViewById(R.id.tv_date1);
        tv_date2 = (TextView) v.findViewById(R.id.tv_date2);
        tv_date3 = (TextView) v.findViewById(R.id.tv_date3);
        tv_date4 = (TextView) v.findViewById(R.id.tv_date4);
        tv_date5 = (TextView) v.findViewById(R.id.tv_date5);
        tv_score1 = (TextView) v.findViewById(R.id.tv_score1);
        tv_score2 = (TextView) v.findViewById(R.id.tv_score2);
        tv_score3 = (TextView) v.findViewById(R.id.tv_score3);
        tv_score4 = (TextView) v.findViewById(R.id.tv_score4);
        tv_score5 = (TextView) v.findViewById(R.id.tv_score5);
    }
}