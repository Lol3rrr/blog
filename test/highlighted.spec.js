import { mount } from '@vue/test-utils'
import Highlight from '@/components/highlight.vue'

describe('Highlight', () => {
  test('is a Vue instance', () => {
    const wrapper = mount(Highlight)
    expect(wrapper.vm).toBeTruthy()
  })
})
