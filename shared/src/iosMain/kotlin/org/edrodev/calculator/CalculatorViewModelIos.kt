package org.edrodev.calculator

import kotlinx.coroutines.flow.launchIn
import kotlinx.coroutines.flow.onEach

fun CalculatorViewModel.onStateChanged(block: (CalculatorState) -> Unit) {
    state
        .onEach { block(it) }
        .launchIn(viewModelScope)
}