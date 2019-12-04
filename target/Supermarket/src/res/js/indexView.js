import Vue from 'src/res/js/vue';

import tree from '../components/treelist.vue'

let all = {
    name: 'all',
    children: {
        A: {
            name: 'A',
            children: {
                a1: {
                    name: 'a1',
                    children: {
                        a11: {
                            name: 'a11',
                            children: null
                        },
                        a12: {
                            name: 'a12',
                            children: null
                        }
                    }
                },
                a2: {
                    name: 'a2',
                    children: {
                        b21: {
                            name: 'b21',
                            children: null
                        }
                    }
                }
            }
        },
        B: {
            name: 'B',
            children: {
                b1: {
                    name: 'b1',
                    children: {
                        b11: {
                            name: 'b11',
                            children: null
                        },
                        b12: {
                            name: 'b12',
                            children: null
                        }
                    }
                },
                b2: {
                    name: 'b2',
                    children: {
                        b21: {
                            name: 'b21',
                            children: null
                        }
                    }
                }
            }
        }
    }
}


const app = new Vue({
    el: "#app",
    components: {
        'tree': tree
    },
    data: {
        treeList: all
    }
})
