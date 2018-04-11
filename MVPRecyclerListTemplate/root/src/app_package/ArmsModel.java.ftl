package ${modelPackageName};

import android.app.Application;
import com.google.gson.Gson;
import com.jess.arms.integration.IRepositoryManager;
import com.jess.arms.mvp.BaseModel;

import com.jess.arms.di.scope.ActivityScope;
import javax.inject.Inject;
import io.reactivex.Observable;


import ${contractPackageName}.${pageName}Contract;
import ${packageName}.mvp.model.entity.${entityName};
import ${packageName}.mvp.model.entity.BaseEntity;

/**
 * @author weizhengyao
 */

@ActivityScope
public class ${pageName}Model extends BaseModel implements ${pageName}Contract.Model{
    @Inject
    Gson mGson;
    @Inject
    Application mApplication;

    @Inject
    public ${pageName}Model(IRepositoryManager repositoryManager) {
        super(repositoryManager);

    }

      @Override
    public Observable<BaseEntity<${entityName}>> ${interfaceMethod}(${requestParam}) {
        Observable<BaseEntity<${entityName}>> ${interfaceMethod} = mRepositoryManager
                .obtainRetrofitService(Service.class).${interfaceMethod}(${requestParam});
        return ${interfaceMethod}.flatMap(baseEntity -> Observable.just(baseEntity));
    }

    @Override
    public void onDestroy() {
        super.onDestroy();
        this.mGson = null;
        this.mApplication = null;
    }
}