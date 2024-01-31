import { Injectable } from "@nestjs/common";
import axios from "axios";
import * as cheerio from "cheerio";

@Injectable()
export class ElementService {


  async crawlElement() {
    try {
      const response = await axios.get("https://palworldtrainer.com/");
      const html = response.data;
      const $ = cheerio.load(html);

      const buttonsArray = Array.from($(".filterset.Elements").find(".filters").find("button")).map((button) => {
        const imgTag = $(button).find("img");
        const imgUrl = imgTag.attr("src");
        const imgAlt = imgTag.attr("alt").replace(" Icon", "");
        return { name: imgAlt, iconUrl: imgUrl };
      });
      // console.log('Buttons Array:', buttonsArray);

      return buttonsArray;
    } catch (error) {
      console.error("Error fetching data:", error);
    }
  }

  async crawlWork() {
    try {
      const response = await axios.get("https://palworldtrainer.com/");
      const html = response.data;
      const $ = cheerio.load(html);

      const buttonsArray = Array.from($(".filterset.Work.Suitability").find(".filters").find("button")).map((button) => {
        const imgTag = $(button).find("img");
        const imgUrl = imgTag.attr("src");
        const imgAlt = imgTag.attr("alt").replace(" Icon", "");
        return { name: imgAlt, iconUrl: imgUrl };
      });
      // console.log('Buttons Array:', buttonsArray);

      return buttonsArray;
    } catch (error) {
      console.error("Error fetching data:", error);
    }
  }

  async crawlPals() {
    try {
      const response = await axios.get("https://palworldtrainer.com/");
      const html = response.data;
      const $ = cheerio.load(html);

      const palNamesArray = Array.from($(".content .card")).map((card) => {
        const palNameElement = $(card).find(".h6.pal-name");
        return palNameElement.text();
      });
      return palNamesArray;


    } catch (error) {
      console.error("Error fetching data:", error);
    }
  }
  async crawlSummary(slug: string){
    try {
      const response = await axios.get(`https://palworldtrainer.com/pal/${slug}`);
      const $ = cheerio.load(response.data);
      return $('.content .summary').eq(0).find('p').text();
    } catch (error) {
      console.error("Error fetching data:", error);
    }
  }

    async crawlPalIcon(slug: string){
        try {
      const response = await axios.get("https://palworldtrainer.com/");
      const html = response.data;
      const $ = cheerio.load(html);

    return $('.header .pal-statue .statue').attr("src");


    } catch (error) {
      console.error("Error fetching data:", error);
    }
  }
}
