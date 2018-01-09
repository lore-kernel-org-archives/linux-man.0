From: Tejun Heo <tj@kernel.org>
Subject: Re: cgroups(7): documenting cgroups v2 thread mode
Date: Tue, 9 Jan 2018 13:10:00 -0800
Message-ID: <20180109211000.GT3668920@devbig577.frc2.facebook.com>
References: <b2d54ae2-62db-7402-ed99-7a0e72f90ff4@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <b2d54ae2-62db-7402-ed99-7a0e72f90ff4@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>
Cc: Peter Zijlstra <peterz@infradead.org>, cgroups@vger.kernel.org, lkml <linux-kernel@vger.kernel.org>, linux-man <linux-man@vger.kernel.org>, "Serge E. Hallyn" <serge@hallyn.com>, Mike Galbraith <efault@gmx.de>, Li Zefan <lizefan@huawei.com>, Ingo Molnar <mingo@redhat.com>, Paul Turner <pjt@google.com>, kernel-team@fb.com, Andy Lutomirski <luto@amacapital.net>, Johannes Weiner <hannes@cmpxchg.org>, Lauro Venancio <lvenanci@redhat.com>, Waiman Long <longman@redhat.com>
List-Id: linux-man@vger.kernel.org

Hello,

On Tue, Jan 02, 2018 at 07:24:01PM +0100, Michael Kerrisk (man-pages) wrote:
>        2. We write the string "threaded" to each of the domain invalid
>           cgroups  under  y,  in  order  to  convert  them to the type
>           threaded.  As a consequence of this step, all threads  under
>           the  threaded  root  now  have  the  type  threaded  and the
>           threaded subtree is now fully usable.   The  requirement  to
>           write  "threaded"  to each of these cgroups is somewhat cum‐
>           bersome, but allows for possible future  extensions  to  the
>           thread-mode model.
> 
>           ┌─────────────────────────────────────────────────────┐
>           │FIXME                                                │
>           ├─────────────────────────────────────────────────────┤
>           │Re  the preceding paragraphs... Are there other rea‐ │
>           │sosn  for  the  (cumbersome)  requirement  to  write │
>           │'threaded'  to  each of the cgroup.type files in the │
>           │threaded subtrees? Tejun Heo mentioned  the  follow‐ │
>           │ing:                                                 │
>           │                                                     │
>           │    Consistency w/ the cgroups right under the root  │
>           │    cgroup.  Because they can be both domains and    │
>           │    threadroots, we can't switch the children over   │
>           │    to thread mode automatically.  Doing that for    │
>           │    cgroups further down in the hierarchy would be   │
>           │    really inconsistent.                             │
>           │                                                     │
>           │But,  it's  not  clear  to  me  how  "Doing that for │
>           │cgroups further  down  in  the  hierarchy  would  be │
>           │really inconsistent", since in the current implemen‐ │
>           │tation, those same thread groups  are  converted  to │
>           │"domain invalid" type.  What am I missing?           │
>           └─────────────────────────────────────────────────────┘

Yeah, I was confused with an earlier varient where we were marking
threaded domains instead of threaded roots.  It's mostly about future
extensibility (especially as Waiman was proposing related changes
there) and not doing things automatically / recursively if possible.

Looks good to me.

Thanks.

-- 
tejun
