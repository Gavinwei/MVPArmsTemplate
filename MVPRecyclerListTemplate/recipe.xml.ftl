<?xml version="1.0"?>
<recipe>
<#if needActivity>
    <merge from="root/AndroidManifest.xml.ftl"
           to="${escapeXmlAttribute(manifestOut)}/AndroidManifest.xml" />
</#if>

<#if needAdapter && generateAdapterLayout>
    <instantiate from="root/res/layout/simpleAdapter.xml.ftl"
                 to="${escapeXmlAttribute(resOut)}/layout/${adapterItemLayoutName}.xml" />
</#if>

<#if needActivity && generateActivityLayout>
    <instantiate from="root/res/layout/simple.xml.ftl"
                 to="${escapeXmlAttribute(resOut)}/layout/${activityLayoutName}.xml" />
</#if>

<#if needFragment && generateFragmentLayout>
    <instantiate from="root/res/layout/simple.xml.ftl"
                 to="${escapeXmlAttribute(resOut)}/layout/${fragmentLayoutName}.xml" />
</#if>


<#if needAdapter>
    <instantiate from="root/src/app_package/ArmsAdapter.java.ftl"
                   to="${projectOut}/src/main/java/${slashedPackageName(adapterPackageName)}/${adapterName}.java" />
    <open file="${projectOut}/src/main/java/${slashedPackageName(adapterPackageName)}/${adapterName}.java" />
</#if>

<#if needActivity>
    <instantiate from="root/src/app_package/ArmsActivity.java.ftl"
                   to="${projectOut}/src/main/java/${slashedPackageName(ativityPackageName)}/${pageName}Activity.java" />
    <open file="${projectOut}/src/main/java/${slashedPackageName(ativityPackageName)}/${pageName}Activity.java" />
</#if>

<#if needEntity>
   <instantiate from="root/src/app_package/ArmsEntity.java.ftl"
                   to="${projectOut}/src/main/java/${slashedPackageName(entityPackageName)}/${entityName}.java" />
    <open file="${projectOut}/src/main/java/${slashedPackageName(entityPackageName)}/${entityName}.java" />
</#if>

<#if needFragment>
    <instantiate from="root/src/app_package/ArmsFragment.java.ftl"
                   to="${projectOut}/src/main/java/${slashedPackageName(fragmentPackageName)}/${pageName}Fragment.java" />
    <open file="${projectOut}/src/main/java/${slashedPackageName(fragmentPackageName)}/${pageName}Fragment.java" />
</#if>

<#if needContract>
    <instantiate from="root/src/app_package/ArmsContract.java.ftl"
                   to="${projectOut}/src/main/java/${slashedPackageName(contractPackageName)}/${pageName}Contract.java" />
</#if >

<#if needPresenter>
    <instantiate from="root/src/app_package/ArmsPresenter.java.ftl"
                   to="${projectOut}/src/main/java/${slashedPackageName(presenterPackageName)}/${pageName}Presenter.java" />
    <open file="${projectOut}/src/main/java/${slashedPackageName(presenterPackageName)}/${pageName}Presenter.java" />
</#if >

<#if needModel>
    <instantiate from="root/src/app_package/ArmsModel.java.ftl"
                   to="${projectOut}/src/main/java/${slashedPackageName(modelPackageName)}/${pageName}Model.java" />
</#if>

<#if needDagger>
    <instantiate from="root/src/app_package/ArmsComponent.java.ftl"
                   to="${projectOut}/src/main/java/${slashedPackageName(componentPackageName)}/${pageName}Component.java" />
    <instantiate from="root/src/app_package/ArmsModule.java.ftl"
                   to="${projectOut}/src/main/java/${slashedPackageName(moudlePackageName)}/${pageName}Module.java" />

</#if>

</recipe>
