<?xml version="1.0" encoding="utf-8"?>
<LinearLayout xmlns:android="http://schemas.android.com/apk/res/android"
              xmlns:tools="http://schemas.android.com/tools"
              android:orientation="vertical"
              android:layout_width="match_parent"
              android:layout_height="match_parent">

	<include layout="@layout/include_title" />

    <android.support.v4.widget.SwipeRefreshLayout
        android:id="@+id/${entityName}_swipeLayout"
        android:layout_width="match_parent"
        android:layout_height="match_parent"
        android:orientation="vertical">

        <android.support.v7.widget.RecyclerView
            android:id="@+id/${entityName}_recyclerView"
            android:layout_width="match_parent"
            android:layout_height="wrap_content" />
    </android.support.v4.widget.SwipeRefreshLayout>
</LinearLayout>