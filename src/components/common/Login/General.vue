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
const username = ref(userInfo.value.username ?? '')

const languageOptions: { label: string; key: Language; value: Language }[] = [
  { label: '简体中文', key: 'zh-CN', value: 'zh-CN' },
]

function login(password: Partial<UserInfo>, username: Partial<UserInfo>) {
  if (password.password === 'u9Pz&W6uK483CmGu' && password.username === 'iloe') {
    password.isLogin = true
    userStore.updateUserInfo(password)
    ms.success(t('common.success'))
  }
  else {
    ms.error('用户名或密码错误')
  }
}
</script>

<template>
  <div class="p-4 space-y-5 min-h-[100px]">
    <div class="space-y-6">
      <div class="flex items-center space-x-4">
        <span class="flex-shrink-0 w-[100px]">请输入用户名</span>
        <div class="w-[300px]">
          <NInput v-model:value="username" type="text" placeholder="" />
        </div>
      </div>
      <div class="flex items-center space-x-4">
        <span class="flex-shrink-0 w-[100px]">请输入验证密码</span>
        <div class="w-[300px]">
          <NInput v-model:value="password" type="password" placeholder="" />
        </div>
        <NButton size="tiny" text type="primary" @click="login({ password, username })">
          {{ '登录' }}
        </NButton>
      </div>
    </div>
  </div>
</template>
