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

const languageOptions: { label: string; key: Language; value: Language }[] = [
  { label: '简体中文', key: 'zh-CN', value: 'zh-CN' },
]

function login(options: Partial<UserInfo>) {
  if (options.password === '123456') {
    options.isLogin = true
    userStore.updateUserInfo(options)
    ms.success(t('common.success'))
  }
  else {
    ms.error('密码错误')
  }
}
</script>

<template>
  <div class="p-4 space-y-5 min-h-[100px]">
    <div class="space-y-6">
      <div class="flex items-center space-x-4">
        <span class="flex-shrink-0 w-[100px]">请输入验证密码</span>
        <div class="w-[300px]">
          <NInput v-model:value="password" type="password" placeholder="" />
        </div>
        <NButton size="tiny" text type="primary" @click="login({ password })">
          {{ '登录' }}
        </NButton>
      </div>
    </div>
  </div>
</template>
