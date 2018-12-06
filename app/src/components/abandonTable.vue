<template>
  <v-layout justify-start align-center column>
    <v-toolbar color="#01C5B9">
      <v-toolbar-title>Abandoned Games Database</v-toolbar-title>
      <v-autocomplete
        :loading="loading"
        :items="items"
        :search-input.sync="search"
        v-model="select"
        cache-items
        class="mx-3"
        flat
        hide-no-data
        hide-details
        label="What old game are you looking for?"
        solo-inverted
      ></v-autocomplete>
    </v-toolbar>
    <v-data-table
      :headers="headers"
      :items="abandonWare"
      dark
      class="elevation-1 mt-5"
    >
      <template slot="items" slot-scope="props">
        <td class="text-xs-left">{{ props.item.title }}</td>
        <td class="text-xs-left">{{ props.item.releaseDate }}</td>
        <td class="text-xs-left">{{ props.item.license }}</td>
        <td class="text-xs-left">{{ props.item.openSource.data[0] ? 'Yes' : 'No' }}</td>
        <td class="text-xs-left">{{ props.item.publisherName }}</td>
        <td class="text-xs-left">{{ props.item.contact }}</td>
        <td class="text-xs-left">{{ props.item.active.data[0] ? 'Yes' : 'No' }}</td>
        <td class="text-xs-left">{{ props.item.genreName }}</td>
        <v-btn
          justify-center
          align-center
          color = red
          @click="() => deleteThis(props.item.title)"
        >
          DELETE
        </v-btn>
      </template>
    </v-data-table>
  </v-layout>
</template>

<script>
export default {
  data() {
    return {
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
