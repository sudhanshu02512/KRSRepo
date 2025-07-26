import { LightningElement } from 'lwc';

export default class MapsNavigation extends LightningElement {
    mapMarkers=[
        {
            location:{
                City:'Ghaziabad',
                Country:'India'
            },
            title: 'The Landmark Building',
            description:
            'Historic <b>11-story</b> building completed in <i>1916</i>'
        }
    ]
}