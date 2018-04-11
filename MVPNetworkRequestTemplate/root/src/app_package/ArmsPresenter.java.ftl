package ${presenterPackageName};

import android.app.Application;

import com.jess.arms.integration.AppManager;
import com.jess.arms.di.scope.ActivityScope;
import com.jess.arms.mvp.BasePresenter;
import me.jessyan.rxerrorhandler.core.RxErrorHandler;
import javax.inject.Inject;
import io.reactivex.schedulers.Schedulers;
import me.jessyan.rxerrorhandler.core.RxErrorHandler;
import me.jessyan.rxerrorhandler.handler.RetryWithDelay;
import io.reactivex.android.schedulers.AndroidSchedulers;
import me.jessyan.rxerrorhandler.handler.ErrorHandleSubscriber;


import ${contractPackageName}.${pageName}Contract;
import ${packageName}.app.utils.RxUtils;
import ${packageName}.mvp.model.entity.${entityName};
import ${packageName}.mvp.model.entity.BaseEntity;


/**
 * @author weizhengyao
 */

@ActivityScope
public class ${pageName}Presenter extends BasePresenter<${pageName}Contract.Model, ${pageName}Contract.View> {
    @Inject
    RxErrorHandler mErrorHandler;
    @Inject
    Application mApplication;
    @Inject
    AppManager mAppManager;

    @Inject
    public ${pageName}Presenter (${pageName}Contract.Model model, ${pageName}Contract.View rootView) {
        super(model, rootView);
    }

    public void ${interfaceMethod}(${requestParam}) {
        mModel.${interfaceMethod}(${requestParam}).subscribeOn(Schedulers.io())
                .retryWhen(new RetryWithDelay(1, 1))
                .doOnSubscribe(disposable -> {

                }).subscribeOn(AndroidSchedulers.mainThread())
                .observeOn(AndroidSchedulers.mainThread())
                .doAfterTerminate(() -> {

                }).compose(RxUtils.bindToLifecycle(mRootView))
                .subscribe(new ErrorHandleSubscriber<BaseEntity<${entityName}>>(mErrorHandler) {
                    @Override
                    public void onNext(BaseEntity<${entityName}> BaseEntity) {
                        mRootView.${interfaceMethod}(BaseEntity);
                    }

                       @Override
                    public void onError(Throwable e) {
                        super.onError(e);
                        mRootView.hideLoading();
                    }
                    
                });

    }

    @Override
    public void onDestroy() {
        super.onDestroy();
        this.mErrorHandler = null;
        this.mAppManager = null;
        this.mApplication = null;
    }
}
