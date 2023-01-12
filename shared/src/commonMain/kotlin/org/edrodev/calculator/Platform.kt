package org.edrodev.calculator

interface Platform {
    val name: String
}

expect fun getPlatform(): Platform