From: "Michael Kerrisk" <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: Review request: pthread_detach.3
Date: Mon, 27 Oct 2008 08:20:20 -0500
Message-ID: <cfd18e0f0810270620q6031d311j4612bffae4d421f@mail.gmail.com>
References: <cfd18e0f0810241423t1e454d60k4d094464e5c80647@mail.gmail.com>
	 <36ca99e90810242321y7f7ee756l6546875ab7388717@mail.gmail.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <36ca99e90810242321y7f7ee756l6546875ab7388717-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Bert Wesarg <bert.wesarg-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, josv-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, "brian m. carlson" <sandals-spVehEqlxw627WubY2PhZQivdfXVPZ6z@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hi Bert,

Thanks for looking the page over.

[...]

>> When a detached thread terminates,
>> its resources are automatically released back to the system without
>> the need for another thread to join with the terminated the thread.
> One 'the' too many.

Fixed, thanks.

>> Attempting to detach an already detached thread results
>> in unspecified behavior.
> Now you have three: undefined, unpredictable, and unspecified.

Good call.  "unpredictable" has now disappeared from pthread_join.3.

Cheers,

Michael

-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
git://git.kernel.org/pub/scm/docs/man-pages/man-pages.git
man-pages online: http://www.kernel.org/doc/man-pages/online_pages.html
Found a bug? http://www.kernel.org/doc/man-pages/reporting_bugs.html
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
