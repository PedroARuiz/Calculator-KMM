package org.edrodev.calculator

import kotlinx.coroutines.CoroutineScope

expect open class ViewModel() {
    internal val viewModelScope: CoroutineScope
}
