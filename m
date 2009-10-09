From: Petr Baudis <pasky-AlSwsSmVLrQ@public.gmane.org>
Subject: Re: [PATCH] Add the pthread_rwlock_unlock() different point
 explanation between Linux and POSIX
Date: Fri, 9 Oct 2009 08:59:02 +0200
Message-ID: <20091009065901.GB3708@machine.or.cz>
References: <4A63CDF9.6040603@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <4A63CDF9.6040603-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Zhang Xiliang <zhangxiliang-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Cc: mtk-manpages-hi6Y0CQ0nG0@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

  Hi!

On Mon, Jul 20, 2009 at 09:52:57AM +0800, Zhang Xiliang wrote:
> I tested the unlock order of rwlock in Linux with SCHED_FIFO and SCHED_RR, and found 
> that when readers blocked has higher priority than writers, writers always shall 
> take precedence over readers.
> 
> A write process                         <--unlock the rwlock
>   ->A higher priority read process      <--block
>   ->A lower priority write process      <--acquired rwlock
> 
> In pthread_rwlock_rdlock() manual, it says: If the Thread Execution Scheduling option is
> supported, when threads executing with the scheduling policies SCHED_FIFO, SCHED_RR, or 
> SCHED_SPORADIC are waiting on the lock, they shall acquire the lock in priority order
> when the lock becomes available.
> 
> Signed-off-by: Zhang Xiliang <zhangxiliang-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>

  I wonder if there is some kind of policy about how to incorporate this
information; putting it in the POSIX manpages is probably unfeasible,
but maybe a nptl(7) man-page could be created, covering implementation
notes, and put in SEE ALSO section of all pthread manpages?

-- 
				Petr "Pasky" Baudis
A lot of people have my books on their bookshelves.
That's the problem, they need to read them. -- Don Knuth
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
