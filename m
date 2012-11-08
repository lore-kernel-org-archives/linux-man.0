From: "Kirill A. Shutemov" <kirill-oKw7cIdHH8eLwutG50LtGA@public.gmane.org>
Subject: Re: [RFC 1/3] mm: Add VM pressure notifications
Date: Thu, 8 Nov 2012 19:14:22 +0200
Message-ID: <20121108171421.GA4824@shutemov.name>
References: <20121107105348.GA25549@lizard>
 <20121107110128.GA30462@lizard>
 <20121108170124.GB8218@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 8BIT
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20121108170124.GB8218-l3A5Bk7waGM@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mel Gorman <mgorman-l3A5Bk7waGM@public.gmane.org>
Cc: Anton Vorontsov <anton.vorontsov-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Pekka Enberg <penberg-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Leonid Moiseichuk <leonid.moiseichuk-xNZwKgViW5gAvxtiuMwx3w@public.gmane.org>, KOSAKI Motohiro <kosaki.motohiro-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Minchan Kim <minchan-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, John Stultz <john.stultz-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-mm-Bw31MaZKKs3YtjvyW6yDsg@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linaro-kernel-cunTk1MwBs8s++Sfvej+rw@public.gmane.org, patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, kernel-team-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Thu, Nov 08, 2012 at 05:01:24PM +0000, Mel Gorman wrote:
> (Sorry about being very late reviewing this)
> 
> On Wed, Nov 07, 2012 at 03:01:28AM -0800, Anton Vorontsov wrote:
> > This patch introduces vmpressure_fd() system call. The system call creates
> > a new file descriptor that can be used to monitor Linux' virtual memory
> > management pressure. There are three discrete levels of the pressure:
> > 
> 
> Why was eventfd unsuitable? It's a bit trickier to use but there are
> examples in the kernel where an application is required to do something like
> 
> 1. open eventfd
> 2. open a control file, say /proc/sys/vm/vmpressure or if cgroups
>    /sys/fs/cgroup/something/vmpressure
> 3. write fd_event fd_control [low|medium|oom]. Can be a binary structure
>    you write
> 
> and then poll the eventfd. The trickiness is awkward but a library
> implementation of vmpressure_fd() that mapped onto eventfd properly should
> be trivial.
> 
> I confess I'm not super familiar with eventfd and if this can actually
> work in practice

You've described how it works for memory thresholds and oom notifications
in memcg. So it works. I also prefer this kind of interface.

See Documentation/cgroups/cgroups.txt section 2.4 and
Documentation/cgroups/memory.txt sections 9 and 10.

-- 
 Kirill A. Shutemov
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
