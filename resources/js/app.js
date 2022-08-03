/**
 * First we will load all of this project's JavaScript dependencies which
 * includes Vue and other libraries. It is a great starting point when
 * building robust, powerful web applications using Vue and Laravel.
 */
import Swal from 'sweetalert2/dist/sweetalert2.js'
require('./bootstrap');
var moment = require('moment');
require('./views_functions/datatables_events.js');
require('./views_functions/users/ticket.js');
require('./views_functions/formsubmit.js');
require('./views_functions/init.js');
require('./views_functions/users/functions.js');
//import CKEditor from '@ckeditor/ckeditor5-vue2';
import 'datatables.net-bs4/js/dataTables.bootstrap4.min.js';
import 'bootstrap-select/dist/js/bootstrap-select.min.js';
import store from './store'
import Vue from 'vue';
import VueClipboard from 'vue-clipboard2'


import CKEditor from 'ckeditor4-vue';

window.Vue = require('vue');
Vue.use( CKEditor );
Vue.use(VueClipboard)

/**
 * The following block of code may be used to automatically register your
 * Vue components. It will recursively scan this directory for the Vue
 * components and automatically register them with their "basename".
 *
 * Eg. ./components/ExampleComponent.vue -> <example-component></example-component>
 */

// const files = require.context('./', true, /\.vue$/i)
// files.keys().map(key => Vue.component(key.split('/').pop().split('.')[0], files(key).default))

//Vue.component('example-component', require('./components/ExampleComponent.vue').default);

Vue.component(
    'table-vue',
    require('@/components/TableVue.vue').default
);
Vue.component(
    'table-ticket',
    require('@/components/TableVueTicket.vue').default
);
Vue.component(
    'profile-sidebar',
    require('@/components/ProfileSidebar.vue').default
);
Vue.component(
    'modal-profile',
    require('@/components/ModalProfile.vue').default
);
Vue.component(
    'ticket',
    require('@/components/Ticket.vue').default
);
Vue.component(
    'repository-index',
    require('@/components/repository/Index.vue').default
);

Vue.component(
    'create-report',
    require('@/components/reports/CreateReport.vue').default
);

Vue.component(
    'edit-report',
    require('@/components/reports/EditReport.vue').default
);

Vue.component(
    'search-tickets',
    require('./components/SearchUserTicket.vue').default
);
/*
Vue.component(
    'edit-tickets',
    require('./components/EditTicket.vue').default
);*/

/**
 * Next, we will create a fresh Vue application instance and attach it to
 * the page. Then, you may begin adding components to this application
 * or customize the JavaScript scaffolding to fit your unique needs.
 */

const app = new Vue({
    el: '#app',
    store,
});
