# Campaign Manager 360 Block

<br>

### Why use the Looker Campaign Manager 360 Block?
**(1) Rapid Time To Value** - Gain insights from your Campaign Manager 360 (CM 360) data in minutes, not weeks. The CM 360 Block includes pre-built dashboards and content focusing on the ad management system for advertisers and agencies, with analysis around campaign performance, reach and impressions.

**(2) Centralized Place for Analysis** -  No CM 360 access required to do self-service reporting. Plus, you can combine your CM 360 data with other data in your warehouse (e.g. Bitbucket or Github commits) for end-to-end analysis.


**(3) Enterprise Data Platform** - Your marketing team can easily build their own dashboards, and any user is equipped to ask and answer their own questions, save and share their own reports. Additionally, you can take advantage of Looker’s advanced scheduling functionality to get Alerts whenever workflows are disrupted. Using our Data Health Check dashboard within the block you can monitor redacted User IDs within CM 360.

**(4) Take Action on Your Data Quickly**  - Analysts can jump into the CM 360 dashboards and clearly see performance trends by toggling between different performance KPIs and viewing attribute breakdowns. From the dashboard, directly link to the specific campaign in the CM 360 console.

<br>

### Campaign Manager 360 Data Structure and Schema

This block version is based off of Data Transfer v2.0. Please note that fields for "Landing Page URL ID", "Impression ID" and "Referrer URL" are not included in this block. These fields can be added into the config files if needed.

CM 360 data is exported through [Transfer Services](https://cloud.google.com/bigquery-transfer/docs/doubleclick-campaign-transfer) in the format of three flat tables (a single file for impressions, clicks, and activities). All Data Transfer Files are stored as comma separated values (CSV).

Filenames are a combination of dcm ID (like account, or floodlight), data transfer type (impression, click, activity, or rich_media), the date and hour of the processed file (YYYYMMDDHH), the day the report was generated (YYYYMMDD), the time the report was generated (HHMMSS), and the execution ID of the report separated by underscores. A more detailed description of the Data Transfer customisation and fields can be found [here](https://developers.google.com/doubleclick-advertisers/dtv2/reference/file-format).

It is strongly recommended that you load all match tables into your warehouse to allow your business users to gain a deeper understanding into the naming conventions of your campaigns, activities, ads, advertisers, assets, and browsers. More information on all Data Transfer match tables can also be found [here](https://developers.google.com/doubleclick-advertisers/dtv2/reference/match-tables).

<br>

### Customizations

 * Within the ```(2) Top Performers & Breakdowns``` dashboard there are three breakdown tiles that are configurable. It is recommended to import this dashboard and edit these tiles to create custom classifications based on placement name or campaign tactic. Once configured, you  can drill into these metrics to get an additional level of granularity into underlying factors.

<br>

### What if I find an error? Suggestions for improvements?

What if I find an error? Suggestions for improvements?
Great! Blocks were designed for continuous improvement through the help of the entire Looker community, and we'd love your input. To log an error or improvement recommendations, simply create a "New Issue" in the corresponding [Github repo](https://github.com/llooker/block-google-campaign-manager-dts) for this Block. Please be as detailed as possible in your explanation, and we'll address it as quick as we can.
