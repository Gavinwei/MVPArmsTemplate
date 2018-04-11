package ${ativityPackageName};

import android.content.Intent;
import android.os.Bundle;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;

import android.support.v4.widget.SwipeRefreshLayout;
import android.support.v7.widget.RecyclerView;
import com.jess.arms.base.BaseActivity;
import com.jess.arms.di.component.AppComponent;
import com.jess.arms.utils.ArmsUtils;

import ${componentPackageName}.Dagger${pageName}Component;
import ${moudlePackageName}.${pageName}Module;
import ${contractPackageName}.${pageName}Contract;
import ${presenterPackageName}.${pageName}Presenter;

import ${packageName}.R;
import ${packageName}.mvp.model.entity.${entityName};
import com.chad.library.adapter.base.loadmore.LoadMoreView;

import static com.jess.arms.utils.Preconditions.checkNotNull;
import com.chad.library.adapter.base.BaseQuickAdapter;
import butterknife.BindView;

import com.xiaofeibao.xiaofeibao.mvp.ui.widget.CustomLoadMoreView;
import java.util.List;
import ${adapterPackageName}.${adapterName}Adapter;
import butterknife.ButterKnife;
import java.util.ArrayList;
import ${packageName}.mvp.ui.widget.RecyclerViewNoBugLinearLayoutManager;
import ${packageName}.mvp.model.entity.BaseEntity;
import ${packageName}.mvp.model.entity.${entityName};
import ${packageName}.mvp.model.api.State;
import ${adapterPackageName}.${adapterName};

/**
 * @author gavinwead
 */

public class ${pageName}Activity extends BaseActivity<${pageName}Presenter> implements ${pageName}Contract.View,
    SwipeRefreshLayout.OnRefreshListener, BaseQuickAdapter.RequestLoadMoreListener {
    @BindView(R.id.${entityName}_recyclerView)
    RecyclerView ${entityName}RecyclerView;
    @BindView(R.id.${entityName}_swipeLayout)
    SwipeRefreshLayout ${entityName}SwipeLayout;

    private CustomLoadMoreView loadMoreView;
    private List<${entityName}> ${entityName}s;
    private ${adapterName}  m${adapterName};
    private int mPage;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        ButterKnife.bind(this);
        initView();
    }

    @Override
    public void setupActivityComponent(@NonNull AppComponent appComponent) {
        Dagger${pageName}Component //如找不到该类,请编译一下项目
                .builder()
                .appComponent(appComponent)
                .${extractLetters(pageName[0]?lower_case)}${pageName?substring(1,pageName?length)}Module(new ${pageName}Module(this))
                .build()
                .inject(this);
    }

    @Override
    public int initView(@Nullable Bundle savedInstanceState) {
        return R.layout.${activityLayoutName}; //如果你不需要框架帮你设置 setContentView(id) 需要自行设置,请返回 0
    }

    @Override
    public void initData(@Nullable Bundle savedInstanceState) {
        ${entityName}s=new ArrayList<>();
       
    }

    private void initView(){
        ${entityName}SwipeLayout.setOnRefreshListener(this);
        loadMoreView = new CustomLoadMoreView();
        ${entityName}RecyclerView.setLayoutManager(new RecyclerViewNoBugLinearLayoutManager(this));
        m${adapterName} = new ${adapterName}(this,R.layout.${adapterItemLayoutName},${entityName}s);
        ${entityName}RecyclerView.setAdapter(m${adapterName});
        m${adapterName}.setLoadMoreView(loadMoreView);
        m${adapterName}.setOnLoadMoreListener(this,${entityName}RecyclerView);


    }

    @Override
    public void onRefresh() {
        mPage = 0;

    }

    @Override
    public void onLoadMoreRequested() {
        mPage++;
        ${entityName}SwipeLayout.setRefreshing(false);
    }

    @Override
    public void showLoading() {

    }

    @Override
    public void hideLoading() {

    }

    @Override
    public void ${interfaceMethod}(BaseEntity<${entityName}> ${entityName}Entity){
        ${entityName}SwipeLayout.setRefreshing(false);
        if(${entityName}Entity.getMsg_type() == State.SUCCESS){
            if(${entityName}Entity.getData().size() > 0){
                ${entityName}s.addAll(${entityName}Entity.getData());
                m${adapterName}.loadMoreComplete();
                if(${entityName}s.size() < 10){
                    m${adapterName}.loadMoreEnd(false);
                }
            }else {
                m${adapterName}.loadMoreEnd(false);
            }  
            
               m${adapterName}.notifyDataSetChanged();
        }


    }

    @Override
    public void showMessage(@NonNull String message) {
        checkNotNull(message);
        ArmsUtils.snackbarText(message);
    }

    @Override
    public void launchActivity(@NonNull Intent intent) {
        checkNotNull(intent);
        ArmsUtils.startActivity(intent);
    }

    @Override
    public void killMyself() {
        finish();
    }
}
