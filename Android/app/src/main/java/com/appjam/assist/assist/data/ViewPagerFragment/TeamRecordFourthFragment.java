package com.appjam.assist.assist.data.ViewPagerFragment;

import android.content.SharedPreferences;
import android.os.Bundle;
import android.preference.PreferenceManager;
import android.support.annotation.Nullable;
import android.support.v4.app.Fragment;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.TextView;

import com.appjam.assist.assist.BaseActivity;
import com.appjam.assist.assist.R;
import com.appjam.assist.assist.model.response.AssistRank;
import com.appjam.assist.assist.model.response.RankingResult;
import com.appjam.assist.assist.model.response.ScoreRank;
import com.appjam.assist.assist.network.ApplicationController;
import com.appjam.assist.assist.network.NetworkService;
import com.bumptech.glide.Glide;

import java.nio.BufferUnderflowException;
import java.util.ArrayList;

import jp.wasabeef.glide.transformations.CropCircleTransformation;
import retrofit2.Call;
import retrofit2.Callback;
import retrofit2.Response;

/**
 * Created by gominju on 2017. 6. 29..
 */

public class TeamRecordFourthFragment extends Fragment {
    private View v;
    private ImageView iv_score1, iv_score2, iv_score3, iv_score4, iv_assist1, iv_assist2, iv_assist3, iv_assist4;
    private TextView tv_score_name1, tv_score_name2, tv_score_name3, tv_score_name4,
            tv_score_num1, tv_score_num2, tv_score_num3, tv_score_num4,
            tv_assist_name1, tv_assist_name2, tv_assist_name3, tv_assist_name4,
            tv_assist_num1, tv_assist_num2, tv_assist_num3, tv_assist_num4;
    private NetworkService networkService;
    private int team_id;
    private ArrayList<ScoreRank> scoreRank;
    private ArrayList<AssistRank> assistRank;

    public TeamRecordFourthFragment newInstance(ArrayList<ScoreRank> scoreRank, ArrayList<AssistRank> assistRank) {
        TeamRecordFourthFragment fragment = new TeamRecordFourthFragment();
        this.scoreRank = scoreRank;
        this.assistRank = assistRank;

        Bundle bundle = new Bundle();
        bundle.putSerializable("rank1", scoreRank);
        bundle.putSerializable("rank2", assistRank);

        fragment.setArguments(bundle);
        return fragment;
    }

    @Nullable
    @Override
    public View onCreateView(LayoutInflater inflater, @Nullable ViewGroup container, @Nullable Bundle savedInstanceState) {
        v = inflater.inflate(R.layout.vp_team_fourth, container, false);
        BaseActivity.setGlobalFont(getContext(), getActivity().getWindow().getDecorView());

        scoreRank = (ArrayList<ScoreRank>) getArguments().getSerializable("rank1");
        assistRank = (ArrayList<AssistRank>) getArguments().getSerializable("rank2");

        SharedPreferences preferences = PreferenceManager.getDefaultSharedPreferences(getContext());
        team_id = preferences.getInt("team_id", 0);

        initView();
//        initNetwork();
        return v;
    }

    private void initNetwork() {
        networkService = ApplicationController.getInstance().getNetworkService();

        Call<RankingResult> result = networkService.getRankList(team_id);
        result.enqueue(new Callback<RankingResult>() {
            @Override
            public void onResponse(Call<RankingResult> call, Response<RankingResult> response) {
                if (response.isSuccessful()) {
                    scoreRank = response.body().response.score;
                    assistRank = response.body().response.assist;
                    setListData();
                }
            }

            @Override
            public void onFailure(Call<RankingResult> call, Throwable t) {

            }
        });
    }

    private void setListData() {
        // 득점 순위
        int list_size = scoreRank.size();
        boolean p1 = false, p2 = false, p3 = false, p4 = false;

        switch (list_size) {
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
                break;
            default:
                break;
        }

        if (p1) {
            Glide.with(this)
                    .load("http://13.124.136.174:3000/static/images/profileImg/player/" + scoreRank.get(0).getProfile_pic_url())
                    .bitmapTransform(new CropCircleTransformation(getContext()))
                    .into(iv_score1);
            tv_score_name1.setText(scoreRank.get(0).getUsername());
            tv_score_num1.setText(scoreRank.get(0).getScore() + "득점");

            Glide.with(this)
                    .load("http://13.124.136.174:3000/static/images/profileImg/player/" + assistRank.get(0).getProfile_pic_url())
                    .bitmapTransform(new CropCircleTransformation(getContext()))
                    .into(iv_assist1);
            tv_assist_name1.setText(assistRank.get(0).getUsername());
            tv_assist_num1.setText(assistRank.get(0).getAssist() + "도움");

        } else {
            tv_score_name1.setText("-");
            tv_score_num1.setText("-");
            tv_assist_name1.setText("-");
            tv_assist_num1.setText("-");
        }
        if (p2) {
            Glide.with(this)
                    .load("http://13.124.136.174:3000/static/images/profileImg/player/" + scoreRank.get(1).getProfile_pic_url())
                    .bitmapTransform(new CropCircleTransformation(getContext()))
                    .into(iv_score1);
            tv_score_name2.setText(scoreRank.get(1).getUsername());
            tv_score_num2.setText(scoreRank.get(1).getScore() + "득점");

            Glide.with(this)
                    .load("http://13.124.136.174:3000/static/images/profileImg/player/" + assistRank.get(1).getProfile_pic_url())
                    .bitmapTransform(new CropCircleTransformation(getContext()))
                    .into(iv_assist2);
            tv_assist_name2.setText(assistRank.get(1).getUsername());
            tv_assist_num2.setText(assistRank.get(1).getAssist() + "도움");
        } else {
            tv_score_name2.setText("-");
            tv_score_num2.setText("-");
            tv_assist_name2.setText("-");
            tv_assist_num2.setText("-");
        }
        if (p3) {
            Glide.with(this)
                    .load("http://13.124.136.174:3000/static/images/profileImg/player/" + scoreRank.get(2).getProfile_pic_url())
                    .bitmapTransform(new CropCircleTransformation(getContext()))
                    .into(iv_score1);
            tv_score_name3.setText(scoreRank.get(2).getUsername());
            tv_score_num3.setText(scoreRank.get(2).getScore() + "득점");

            Glide.with(this)
                    .load("http://13.124.136.174:3000/static/images/profileImg/player/" + assistRank.get(2).getProfile_pic_url())
                    .bitmapTransform(new CropCircleTransformation(getContext()))
                    .into(iv_assist3);
            tv_assist_name3.setText(assistRank.get(2).getUsername());
            tv_assist_num3.setText(assistRank.get(2).getAssist() + "도움");
        } else {
            tv_score_name3.setText("-");
            tv_score_num3.setText("-");
            tv_assist_name3.setText("-");
            tv_assist_num3.setText("-");
        }
        if (p4) {
            Glide.with(this)
                    .load("http://13.124.136.174:3000/static/images/profileImg/player/" + scoreRank.get(3).getProfile_pic_url())
                    .bitmapTransform(new CropCircleTransformation(getContext()))
                    .into(iv_score1);
            tv_score_name4.setText(scoreRank.get(3).getUsername());
            tv_score_num4.setText(scoreRank.get(3).getScore() + "득점");

            Glide.with(this)
                    .load("http://13.124.136.174:3000/static/images/profileImg/player/" + assistRank.get(3).getProfile_pic_url())
                    .bitmapTransform(new CropCircleTransformation(getContext()))
                    .into(iv_assist4);
            tv_assist_name4.setText(assistRank.get(3).getUsername());
            tv_assist_num4.setText(assistRank.get(3).getAssist() + "도움");
        } else {
            tv_score_name4.setText("-");
            tv_score_num4.setText("-");
            tv_assist_name4.setText("-");
            tv_assist_num4.setText("-");
        }
    }

    private void initView() {
        iv_score1 = (ImageView) v.findViewById(R.id.iv_score1);
        iv_score2 = (ImageView) v.findViewById(R.id.iv_score2);
        iv_score3 = (ImageView) v.findViewById(R.id.iv_score3);
        iv_score4 = (ImageView) v.findViewById(R.id.iv_score4);
        iv_assist1 = (ImageView) v.findViewById(R.id.iv_assist1);
        iv_assist2 = (ImageView) v.findViewById(R.id.iv_assist2);
        iv_assist3 = (ImageView) v.findViewById(R.id.iv_assist3);
        iv_assist4 = (ImageView) v.findViewById(R.id.iv_assist4);
        tv_score_name1 = (TextView) v.findViewById(R.id.tv_score_name1);
        tv_score_name2 = (TextView) v.findViewById(R.id.tv_score_name2);
        tv_score_name3 = (TextView) v.findViewById(R.id.tv_score_name3);
        tv_score_name4 = (TextView) v.findViewById(R.id.tv_score_name4);
        tv_score_num1 = (TextView) v.findViewById(R.id.tv_score_num1);
        tv_score_num2 = (TextView) v.findViewById(R.id.tv_score_num2);
        tv_score_num3 = (TextView) v.findViewById(R.id.tv_score_num3);
        tv_score_num4 = (TextView) v.findViewById(R.id.tv_score_num4);
        tv_assist_name1 = (TextView) v.findViewById(R.id.tv_assist_name1);
        tv_assist_name2 = (TextView) v.findViewById(R.id.tv_assist_name2);
        tv_assist_name3 = (TextView) v.findViewById(R.id.tv_assist_name3);
        tv_assist_name4 = (TextView) v.findViewById(R.id.tv_assist_name4);
        tv_assist_num1 = (TextView) v.findViewById(R.id.tv_assist_num1);
        tv_assist_num2 = (TextView) v.findViewById(R.id.tv_assist_num2);
        tv_assist_num3 = (TextView) v.findViewById(R.id.tv_assist_num3);
        tv_assist_num4 = (TextView) v.findViewById(R.id.tv_assist_num4);
    }
}
