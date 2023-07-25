package com.projects.customvideoplayer

import androidx.annotation.Nullable
import androidx.lifecycle.Lifecycle

interface LifecycleProvider{
    @Nullable
    fun getLifecycle(): Lifecycle?
}