<template>
  <v-layout justify-start align-center column>
    <v-toolbar color="#01C5B9">
      <v-toolbar-title>Abandoned Games Database</v-toolbar-title>
      <v-text-field
        label="What game are you looking for?"
        v-model="searchQuery"
        clearable
        solo
        dark
        class="ma-2 pt-2"
      ></v-text-field>
      <v-btn
        color="#01A59B"
        @click="filterOnClick"
      >Search</v-btn>
      <v-btn
        color="#01A59B"
        @click="resetOnClick"
      >Reset</v-btn>
    </v-toolbar>
    <div v-if="reset">
      <v-data-table
        :headers="headers"
        :items="abandonWare"
        dark
        class="elevation-1 mt-5"
      >
        <template slot="items" slot-scope="props">
          <td class="text-xs-right">{{ props.item.title }}</td>
          <td class="text-xs-right">{{ props.item.releaseDate }}</td>
          <td class="text-xs-right">{{ props.item.license }}</td>
          <td class="text-xs-right">{{ props.item.openSource }}</td>
          <td class="text-xs-right">{{ props.item.publisher }}</td>
          <td class="text-xs-right">{{ props.item.contact }}</td>
          <td class="text-xs-right">{{ props.item.active }}</td>
          <td class="text-xs-right">{{ props.item.genre }}</td>
          <v-btn
            justify-center
            align-center
            color = red
            @click="() => deleteThis(props.item.title)"
          >DELETE</v-btn>
        </template>
      </v-data-table>
    </div>
    <div v-else>
      <v-data-table
        :headers="headers"
        :items="filteredItems"
        dark
        class="elevation-1 mt-5"
      >
        <template slot="items" slot-scope="props">
          <td class="text-xs-right">{{ props.item.title }}</td>
          <td class="text-xs-right">{{ props.item.releaseDate }}</td>
          <td class="text-xs-right">{{ props.item.license }}</td>
          <td class="text-xs-right">{{ props.item.openSource }}</td>
          <td class="text-xs-right">{{ props.item.publisher }}</td>
          <td class="text-xs-right">{{ props.item.contact }}</td>
          <td class="text-xs-right">{{ props.item.active }}</td>
          <td class="text-xs-right">{{ props.item.genre }}</td>
          <v-btn
            justify-center
            align-center
            color = red
            @click="() => deleteThis(props.item.title)"
          >DELETE</v-btn>
        </template>
      </v-data-table>
    </div>
  </v-layout>
</template>

<script>
/* eslint-disable */
export default {
  data() {
    return {
      searchQuery: null,
      reset: true,
      headers: [
        {
          text: 'Title',
          align: 'left',
          sortable: false,
          value: 'title',
        },
        { text: 'Release Date', value: 'releaseDate' },
        { text: 'License', value: 'license' },
        { text: 'Open Source', value: 'openSource' },
        { text: 'Publisher', value: 'publisherName' },
        { text: 'Contact', value: 'contact' },
        { text: 'Active', value: 'active' },
        { text: 'Genre', value: 'genreName' },
      ],
      abandonWare: [],
    };
  },
  methods: {
    filterOnClick() {
      this.abandonWare.filter((e) => {
        if (e.title.toLowerCase().includes(this.searchQuery.toLowerCase())){
          console.log(`${e.title} is a match!`);
          this.filteredItems.push(e);
        }
      });
      this.reset = false;
    },
    resetOnClick() {
      this.reset = true;
    },
    fetchDatabase() {
      fetch('http://localhost:4000/showgames', { method: 'GET', mode: 'cors', headers: { 'Access-Control-Allow-Origin': '*' } })
        .then(res => res.json())
        // .then(data => console.log(data));
        .then(data => this.abandonWare = [ ...data ]);
    },
    deleteThis(title){
      console.log(`Deleting: ${title}`);
      fetch(`http://localhost:4000/deletegame/?${title}`, { method: 'Delete', mode: 'cors', headers: { 'Access-Control-Allow-Origin': '*' } })
        .then(res => res.json())
        .then(data => console.log(data));

      this.fetchDatabase();
    },
  },
  created() {
    this.fetchDatabase();
  },
};
</script>

<style scoped lang="scss">

</style>
