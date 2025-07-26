public class MyChatter  {
    public static void postToChatter(){
        
        //Feed Input
        ConnectApi.FeedItemInput feedItemInput = new ConnectApi.FeedItemInput();
        
        //Prepare MessageInput
        ConnectApi.MessageBodyInput messageBodyInput = new ConnectApi.MessageBodyInput();
		messageBodyInput.messageSegments = new List<ConnectApi.MessageSegmentInput>();
        
       //Create Mention Segment
        //ConnectApi.MentionSegmentInput mentionSegmentInput = new ConnectApi.MentionSegmentInput();
        //mentionSegmentInput.id = '005dL000000FbMlQAK';
        //messageBodyInput.messageSegments.add(mentionSegmentInput);
        
        //Create Mention Segment2
        ConnectApi.MentionSegmentInput mentionSegmentInput2 = new ConnectApi.MentionSegmentInput();
        mentionSegmentInput2.id = '005dL000009TuZXQA0';
        messageBodyInput.messageSegments.add(mentionSegmentInput2);
        
        //Create Text Segment
        ConnectApi.TextSegmentInput textSegmentInput = new ConnectApi.TextSegmentInput();
        textSegmentInput.text = 'Hello @[005dL000000FbMlQAK]';
        
        // Add Text Segment to MessageINput
        messageBodyInput.messageSegments.add(textSegmentInput);
        
        //Add to Feed Input
		feedItemInput.body = messageBodyInput;
       
        
        //Set Record Id
        feedItemInput.subjectId = '001dL00000jjv3UQAQ';
        //post the chatter
        ConnectApi.FeedElement feedElement = ConnectApi.ChatterFeeds.postFeedElement(Network.getNetworkId(), feedItemInput);  
    }
}