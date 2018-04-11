package ${adapterPackageName};

import com.chad.library.adapter.base.BaseQuickAdapter;
import com.chad.library.adapter.base.BaseViewHolder;
import java.util.List;

import ${packageName}.mvp.model.entity.${entityName};
import com.chad.library.adapter.base.BaseViewHolder;
import java.util.List;
import android.support.annotation.Nullable;
import android.content.Context;

/**
 * @author weizhengyao
 */

public class ${adapterName} extends BaseQuickAdapter<${entityName}, BaseViewHolder>  {
		private Context context;
        public ${adapterName}(Context context, int layoutResId, @Nullable List<${entityName}> data) {
        super(layoutResId, data);
        this.context = context;

        }

        @Override
        protected void convert(BaseViewHolder holder, ${entityName} ${entityName}s) {

        }

}