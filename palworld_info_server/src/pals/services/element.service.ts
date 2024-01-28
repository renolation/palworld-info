import { Injectable } from "@nestjs/common";
import axios from "axios";
import * as cheerio from 'cheerio';
@Injectable()
export class ElementService {


  async crawlElement(){
      try {
        const response = await axios.get('https://palworldtrainer.com/');
        const html = response.data;
        const $ = cheerio.load(html);

        const buttonsArray = Array.from($('.filterset.Elements').find('.filters').find('button')).map((button) => {
          const imgTag = $(button).find('img');
          const imgUrl = imgTag.attr('src');
          const imgAlt = imgTag.attr('alt').replace(' Icon', '');
          return { name: imgAlt, iconUrl: imgUrl };
        });
        // console.log('Buttons Array:', buttonsArray);

        return buttonsArray;
      } catch (error) {
        console.error('Error fetching data:', error);
      }
  }
}
