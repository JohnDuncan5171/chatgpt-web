<script lang="ts" setup>
import { NButton, NInput, useMessage } from 'naive-ui'
import { computed, ref } from 'vue'
import { useUserStore } from '@/store'
import { t } from '@/locales'
import type { UserInfo } from '@/store/modules/user/helper'

const userStore = useUserStore()

const ms = useMessage()

const userInfo = computed(() => userStore.userInfo)

const password = ref(userInfo.value.password ?? '')

function login(password: Partial<UserInfo>) {
  if (password.password === 'u9Pz&W6uK483CmGu') {
    password.isLogin = true
    userStore.updateUserInfo(password)
    ms.success(t('common.success'))
    location.reload()
  }
  else {
    ms.error('用户名或密码错误')
  }
}
</script>

<template>
  <div class="p-4 space-y-5 min-h-[100px]">
    <div class="space-y-6">
      <span class="text-2xl">欢迎使用ChatGPT</span>
    </div>
    <div class="space-y-6">
      <div class="flex items-center space-x-4">
        <span class="flex-shrink-0 w-[300px]">客户：艾乐宜<span class="text-gray-400">（有效期至 2024-05-05）</span></span>
      </div>
      <div class="flex items-center space-x-4">
        <span class="flex-shrink-0 w-[100px]">请输入验证密码</span>
        <div class="w-[300px]">
          <NInput v-model:value="password" type="password" placeholder="" />
        </div>
        <NButton text type="primary" @click="login({ password })">
          {{ '登录' }}
        </NButton>
      </div>
    </div>
  </div>
</template>
