From: "Michael Kerrisk" <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: Review request: new pthread_create(3) page
Date: Fri, 24 Oct 2008 14:16:46 -0500
Message-ID: <cfd18e0f0810241216h78769619h70224115c477c1d3@mail.gmail.com>
References: <cfd18e0f0810221048m75e46850n5206b905897deaeb@mail.gmail.com>
	 <36ca99e90810221408t29afc0f7gddf40029f9cde3df@mail.gmail.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <36ca99e90810221408t29afc0f7gddf40029f9cde3df-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Bert Wesarg <bert.wesarg-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, josv-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, "brian m. carlson" <sandals-spVehEqlxw627WubY2PhZQivdfXVPZ6z@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hello Bert,

Thanks again for reviewing.

[...]
>> .SH DESCRIPTION
>> The
>> .BR pthread_create ()
>> functions starts a new thread in the calling process.
> function

fixed.

[...]
>>    /* Allocate memory for pthread_create() arguments */
>>
>>    tinfo = calloc(argc \- 1, num_threads);
>    tinfo = calloc(num_threads, sizeof(*tinfo));

Thanks.  I had reworked the program to use getopt, and missed cleanin
this piece up.

[...]
>>        printf("Joined with thread %d; returned value was %s\\n",
>>                tinfo[tnum].thread_num, (char *) res);
>>        free(res);      /* Free memory allocated by thread */
>>    }
>     free(tinfo); /*you free res, so you can free this too */

Yes -- good point.  Fixed.

Thanks,

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
