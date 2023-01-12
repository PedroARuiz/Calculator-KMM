package org.edrodev.calculator

import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.SupervisorJob

actual open class ViewModel {
    internal actual val viewModelScope: CoroutineScope = CoroutineScope(SupervisorJob() + MainDispatcher)
}
