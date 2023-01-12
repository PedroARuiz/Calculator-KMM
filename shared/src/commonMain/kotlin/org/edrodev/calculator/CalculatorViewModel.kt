package org.edrodev.calculator

import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.update

open class CalculatorViewModel: ViewModel() {

    val state: MutableStateFlow<CalculatorState> = MutableStateFlow(CalculatorState())

    fun onNumberSelected(number: String) = state.update {
        if (it.operation.isEmpty()) {
            it.copy(leftNumber = (it.leftNumber + number))
        } else {
            it.copy(rightNumber = (it.rightNumber + number))
        }
    }

    fun onOperationSelected(operation: String) {
        state.update {
            it.copy(operation = operation)
        }
    }

    fun clear() {
        state.update { CalculatorState() }
    }

    fun calculate() = state.update {
        when (it.operation) {
            "+" -> (it.leftNumber.toDouble() + it.rightNumber.toDouble()).toString()
            else -> error("operation ${it.operation} not supported")
        }.let { result ->
            CalculatorState(
                leftNumber = result,
            )
        }
    }
}

data class CalculatorState(
    val leftNumber: String = "0",
    val operation: String = "",
    val rightNumber: String = "0",
) {
    val label: String = (if (operation.isEmpty()) leftNumber else rightNumber).let {
        if (it == "0") {
            it
        } else {
            it.trimStart('0')
        }
    }
}
