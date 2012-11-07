From: Greg Thelen <gthelen-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Subject: Re: [RFC v3 0/3] vmpressure_fd: Linux VM pressure notifications
Date: Wed, 07 Nov 2012 09:20:35 -0800
Message-ID: <xr93liedfhy4.fsf@gthelen.mtv.corp.google.com>
References: <20121107105348.GA25549@lizard>
	<20121107112136.GA31715@shutemov.name>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20121107112136.GA31715-oKw7cIdHH8eLwutG50LtGA@public.gmane.org> (Kirill A. Shutemov's
	message of "Wed, 7 Nov 2012 13:21:36 +0200")
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Kirill A. Shutemov" <kirill-oKw7cIdHH8eLwutG50LtGA@public.gmane.org>
Cc: Anton Vorontsov <anton.vorontsov-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Mel Gorman <mgorman-l3A5Bk7waGM@public.gmane.org>, Pekka Enberg <penberg-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Leonid Moiseichuk <leonid.moiseichuk-xNZwKgViW5gAvxtiuMwx3w@public.gmane.org>, KOSAKI Motohiro <kosaki.motohiro-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Minchan Kim <minchan-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, John Stultz <john.stultz-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-mm-Bw31MaZKKs3YtjvyW6yDsg@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linaro-kernel-cunTk1MwBs8s++Sfvej+rw@public.gmane.org, patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, kernel-team-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Wed, Nov 07 2012, Kirill A. Shutemov wrote:

> On Wed, Nov 07, 2012 at 02:53:49AM -0800, Anton Vorontsov wrote:
>> Hi all,
>> 
>> This is the third RFC. As suggested by Minchan Kim, the API is much
>> simplified now (comparing to vmevent_fd):
>> 
>> - As well as Minchan, KOSAKI Motohiro didn't like the timers, so the
>>   timers are gone now;
>> - Pekka Enberg didn't like the complex attributes matching code, and so it
>>   is no longer there;
>> - Nobody liked the raw vmstat attributes, and so they were eliminated too.
>> 
>> But, conceptually, it is the exactly the same approach as in v2: three
>> discrete levels of the pressure -- low, medium and oom. The levels are
>> based on the reclaimer inefficiency index as proposed by Mel Gorman, but
>> userland does not see the raw index values. The description why I moved
>> away from reporting the raw 'reclaimer inefficiency index' can be found in
>> v2: http://lkml.org/lkml/2012/10/22/177
>> 
>> While the new API is very simple, it is still extensible (i.e. versioned).
>
> Sorry, I didn't follow previous discussion on this, but could you
> explain what's wrong with memory notifications from memcg?
> As I can see you can get pretty similar functionality using memory
> thresholds on the root cgroup. What's the point?

Related question: are there plans to extend this system call to provide
per-cgroup vm pressure notification?
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
