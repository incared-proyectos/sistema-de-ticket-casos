import Vue from 'vue'
import Vuex from 'vuex'

Vue.use(Vuex)

export default new Vuex.Store({
  state: {
    titulo:'desdeStore no desde un namespace o un nuevo js',
    items_json_search: null,
    items_json_ticket: null

  },
  mutations: {
  	delete_users_json(state,key,item){

		if (state.items_json_ticket !== null) {
			let items_search =  state.items_json_search[key];
			let index = state.items_json_ticket.findIndex( user => user.email == items_search.email );
			state.items_json_ticket.splice(index, 1);
  		}
  		state.items_json_search.splice(key, 1);
  	},
  
    add_users_json(state,items){
  		Vue.set(state, 'items_json_search', items);
    },
    users_json_ticket(state,items){
        Vue.set(state, 'items_json_ticket', items);
    }
  },
  actions: {
  	loadItems: (context, items) => {
        context.commit('add_users_json', items);
   	},
   	deleteItems: (context, items) => {
        context.commit('delete_users_json', items);
   	},
   	loadItemsTicket: (context, items) => {
        context.commit('users_json_ticket', items);
   	}
  
  },
  modules: {
  }
})
