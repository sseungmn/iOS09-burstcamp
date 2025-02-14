import { initializeApp, getApps } from 'firebase-admin/app';
import { pubsub, https } from 'firebase-functions';
import { getBlogTitle } from './service/feedAPI.js';
import { updateFeedDB } from './service/firestoreManager.js'

// Initialize
if ( !getApps().length ) initializeApp()

export const scheduledUpdateFeedDB = pubsub.schedule('every 30 minutes').onRun(async (context) => {
	updateFeedDB()
});

export const fetchBlogTitle = https.onCall(async (data, context) => {
	const blogTitle = await getBlogTitle(data.blogURL)
	return {
		blogTitle: blogTitle
	}
});