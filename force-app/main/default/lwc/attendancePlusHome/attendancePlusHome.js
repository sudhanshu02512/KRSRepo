import { LightningElement } from 'lwc';
import CLOCK_IMAGE from '@salesforce/resourceUrl/clock_in_out_image';
import ATTENDANCE_SHEET_IMAGE from '@salesforce/resourceUrl/attendance_sheet_image';

export default class AttendancePlusHome extends LightningElement {
    clockButtonLabel;
    clockButtonTitle;
    clockButtonVariant;


    clockImage = CLOCK_IMAGE;
    attendanceSheetImage = ATTENDANCE_SHEET_IMAGE;

    constructor(){
        super();
        this.clockButtonLabel="Loading";
        this.clockButtonTitle="Loading";
        this.clockButtonVariant="destructive-text";

    }

    clockHandler(){

    }
    debugMethod(){
        console.log('Inside Custom Debug');
        console.log(CLOCK_IMAGE);
        //console.log(clockImage;
        
    }
}