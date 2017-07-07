package com.appjam.assist.assist.ranking;

import android.content.Intent;
import android.content.SharedPreferences;
import android.os.Bundle;
import android.preference.PreferenceManager;
import android.support.v7.app.AppCompatActivity;
import android.support.v7.widget.LinearLayoutManager;
import android.support.v7.widget.RecyclerView;
import android.view.View;
import android.widget.AdapterView;
import android.widget.Button;
import android.widget.Spinner;

import com.appjam.assist.assist.BaseActivity;
import com.appjam.assist.assist.MainActivity;
import com.appjam.assist.assist.R;
import com.appjam.assist.assist.model.response.Ranking;
import com.appjam.assist.assist.model.response.RankingResult;
import com.appjam.assist.assist.model.response.TeamRankingResult;
import com.appjam.assist.assist.network.ApplicationController;
import com.appjam.assist.assist.network.NetworkService;

import java.util.ArrayList;
import java.util.List;

import retrofit2.Call;
import retrofit2.Callback;
import retrofit2.Response;

public class RankingActivity extends AppCompatActivity {
    RecyclerView recyclerView;
    // ArrayList<Itemdata_Ranking> itemdata_rankings;
    private NetworkService networkService;
    private int team_id;
    private ArrayList<Ranking> list;
    RankingRecyclerAdapter rankingRecyclerAdapter;
    LinearLayoutManager layoutManager;

    Spinner spinner1;
    AdapterSpinner1 adapterSpinner1;
    private Button btn_home;


    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_ranking);
        BaseActivity.setGlobalFont(this, getWindow().getDecorView());

        recyclerView = (RecyclerView) findViewById(R.id.rank_recyclerView);
        recyclerView.setHasFixedSize(true);
        layoutManager = new LinearLayoutManager(this);
        layoutManager.setOrientation(LinearLayoutManager.VERTICAL);
        recyclerView.setLayoutManager(layoutManager);
        btn_home = (Button)findViewById(R.id.btn_home);

        btn_home.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent intent = new Intent(getApplicationContext(), MainActivity.class);
                intent.addFlags(Intent.FLAG_ACTIVITY_CLEAR_TASK);
                intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
                startActivity(intent);
            }
        });


        List<String> data = new ArrayList<>();
        data.add("성남시");
        data.add("서울시");
        spinner1 = (Spinner) findViewById(R.id.spinner1);
        adapterSpinner1 = new AdapterSpinner1(this, data);

        spinner1.setAdapter(adapterSpinner1);
        spinner1.setPrompt("지역 랭킹");
        spinner1.setOnItemSelectedListener(new AdapterView.OnItemSelectedListener() {
            @Override
            public void onItemSelected(AdapterView<?> parent, View view, int position, long id) {

            }

            @Override
            public void onNothingSelected(AdapterView<?> parent) {

            }
        });

        SharedPreferences preferences = PreferenceManager.getDefaultSharedPreferences(getApplicationContext()); // getContext()아니고 getApplication으로 바꿈
        team_id = preferences.getInt("team_id", 0);

        initNetwork();
    }

    private void initNetwork() {
        networkService = ApplicationController.getInstance().getNetworkService();

        Call<TeamRankingResult> result = networkService.getRankingList();
        result.enqueue(new Callback<TeamRankingResult>() {
            @Override
            public void onResponse(Call<TeamRankingResult> call, Response<TeamRankingResult> response) {
                if (response.isSuccessful()) {
                    list = response.body().response;
                    rankingRecyclerAdapter = new RankingRecyclerAdapter(getApplicationContext(), list, team_id); // getContext를 어플리케이션컨텍스트로
                    recyclerView.setAdapter(rankingRecyclerAdapter);
                    rankingRecyclerAdapter.notifyDataSetChanged();
                }
            }

            @Override
            public void onFailure(Call<TeamRankingResult> call, Throwable t) {

            }
        });
    }
}
