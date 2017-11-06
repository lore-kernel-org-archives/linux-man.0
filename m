From: Arnaldo Carvalho de Melo <acme@kernel.org>
Subject: Re: [PATCH] perf/core: fast breakpoint modification via
 _IOC_MODIFY_BREAKPOINT
Date: Mon, 6 Nov 2017 12:03:50 -0300
Message-ID: <20171106150350.GD2692@kernel.org>
References: <CAMmz+YnaoN3-7DN5WysQvhWNyGhM7_WDz5AQAnvP6FO_GMnMgw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAMmz+YnaoN3-7DN5WysQvhWNyGhM7_WDz5AQAnvP6FO_GMnMgw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Milind Chabbi <chabbi.milind@gmail.com>
Cc: Jiri Olsa <jolsa@redhat.com>, peterz@infradead.org, mingo@redhat.com, alexander.shishkin@linux.intel.com, namhyung@kernel.org, linux-kernel@vger.kernel.org, Michael Kerrisk-manpages <mtk.manpages@gmail.com>, linux-man@vger.kernel.org, mpe@ellerman.id.au, ak@linux.intel.com, kan.liang@intel.com, hbathini@linux.vnet.ibm.com, sukadev@linux.vnet.ibm.com, yao.jin@linux.intel.com
List-Id: linux-man@vger.kernel.org

Em Mon, Nov 06, 2017 at 07:00:29AM -0800, Milind Chabbi escreveu:
> Hi Jirka,
> 
> I see the tabs in my sent email, do you have suggestions on how best to
> send this patch so that the tabs are preserved by the email client?

Documentation/process/email-clients.rst

- Arnaldo
 
> Can anybody else also check if they received with/without tabs?
> 
> release_bp_slot/reserve_bp_slot majic is not necessary since
> _IOC_MODIFY_BREAKPOINT ioctl modifies an already registered breakpoint
> without affecting the count of breakpoints active.
> 
> -Milind
> 
> On Mon, Nov 6, 2017 at 1:23 AM, Jiri Olsa <jolsa@redhat.com> wrote:
> 
> > On Sun, Nov 05, 2017 at 02:35:34PM -0800, Milind Chabbi wrote:
> >
> > SNIP
> >
> > > +static int _perf_event_modify_breakpoint(struct perf_event *bp,
> > > + struct perf_event_attr *attr)
> > > +{
> > > + u64 old_addr = bp->attr.bp_addr;
> > > + u64 old_len = bp->attr.bp_len;
> > > + int old_type = bp->attr.bp_type;
> > > + int err = 0;
> > > +
> > > + _perf_event_disable(bp);
> > > +
> > > + bp->attr.bp_addr = attr->bp_addr;
> > > + bp->attr.bp_type = attr->bp_type;
> > > + bp->attr.bp_len = attr->bp_len;
> > > +
> > > + if (attr->disabled)
> > > + goto end;
> > > +
> > > + err = validate_hw_breakpoint(bp);
> >
> > thre patch is mangled.. seems like you've lost all your tabs somehow
> >
> > anyway, should you also do the release_bp_slot/reserve_bp_slot
> > magic to keep the slot accounting corrent?
> >
> > jirka
> >
