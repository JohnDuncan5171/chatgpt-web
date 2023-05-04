<script lang="ts">
import { defineComponent } from 'vue'
import { useDialog } from 'naive-ui'

export default defineComponent({
  setup() {
    const dialog = useDialog()
    return {
      handleButtonClick() {
        dialog.warning({
          title: '使用渲染函数',
          content: () => 'Content',
          action: () => 'Action',
        })
      },
    }
  },
})
</script>

<template>
  <n-space>
    <n-button @click="handleButtonClick">
      使用渲染函数
    </n-button>
  </n-space>
</template>
