From: "Michael Kerrisk" <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: Review request: new pthread_exit(3) page
Date: Sat, 25 Oct 2008 13:42:48 -0500
Message-ID: <cfd18e0f0810251142p47532d8bla92079f0b4294589@mail.gmail.com>
References: <cfd18e0f0810221048h7d682a8ey71d1517302b18045@mail.gmail.com>
	 <36ca99e90810221358t2ac6090bh84fc5bba6af007fe@mail.gmail.com>
	 <cfd18e0f0810241041n271b62ecsbe75fd957c36a3fa@mail.gmail.com>
	 <36ca99e90810242250g75e4e0a1y1702c25c1323c625@mail.gmail.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <36ca99e90810242250g75e4e0a1y1702c25c1323c625-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Bert Wesarg <bert.wesarg-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, josv-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, "brian m. carlson" <sandals-spVehEqlxw627WubY2PhZQivdfXVPZ6z@public.gmane.org>
List-Id: linux-man@vger.kernel.org

>>>> To allow other threads to continue execution,
>>>> the main thread should terminate by calling
>>>> .BR pthread_create ()
>>>> rather than
>>>> .BR exit (3).
>>> This paragraph sounds wrong.
>>
>> Can you say more please?  Wrong in what way?
> It should call pthread_exit not pthread_create.

D'oh!  I was not seeing the wood for the trees!  Will fix that.

>>> BTW, Linux behaves a little strange if you quit the main thread. For
>>> example in top the task is marked '<defunct>'. If I press Ctrl+Z the
>>> task go to sleep but I don't get my prompt back.
>>
>> Yes.  Can you provide any pointers to further ino. bug reports
>> regarding that problem?
> That may take a while, but I remember darkly that this was on lkml sometime ago.

Was this the thread?

http://thread.gmane.org/gmane.linux.kernel/244552

> This Ctrl+Z-behavior is new to me.

It's new to me too -- but I did verify that it occurs.  I will raise a
report in Bugzilla or on LKML, unless you would rather do it?

Cheers,

Michael
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
