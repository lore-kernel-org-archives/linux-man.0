From: Jiri Olsa <jolsa@redhat.com>
Subject: Re: [PATCH] perf/core: fast breakpoint modification via
 _IOC_MODIFY_BREAKPOINT
Date: Mon, 6 Nov 2017 10:23:05 +0100
Message-ID: <20171106092305.GA16382@krava>
References: <CAMmz+Y=Py0dw63tuww+Oa4rWi_Hghhs3DHmNX=Tf1Yt_JH4O+Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAMmz+Y=Py0dw63tuww+Oa4rWi_Hghhs3DHmNX=Tf1Yt_JH4O+Q@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Milind Chabbi <chabbi.milind@gmail.com>
Cc: peterz@infradead.org, mingo@redhat.com, acme@kernel.org, alexander.shishkin@linux.intel.com, namhyung@kernel.org, linux-kernel@vger.kernel.org, mtk.manpages@gmail.com, linux-man@vger.kernel.org, mpe@ellerman.id.au, ak@linux.intel.com, kan.liang@intel.com, hbathini@linux.vnet.ibm.com, sukadev@linux.vnet.ibm.com, yao.jin@linux.intel.com
List-Id: linux-man@vger.kernel.org

On Sun, Nov 05, 2017 at 02:35:34PM -0800, Milind Chabbi wrote:

SNIP

> +static int _perf_event_modify_breakpoint(struct perf_event *bp,
> + struct perf_event_attr *attr)
> +{
> + u64 old_addr = bp->attr.bp_addr;
> + u64 old_len = bp->attr.bp_len;
> + int old_type = bp->attr.bp_type;
> + int err = 0;
> +
> + _perf_event_disable(bp);
> +
> + bp->attr.bp_addr = attr->bp_addr;
> + bp->attr.bp_type = attr->bp_type;
> + bp->attr.bp_len = attr->bp_len;
> +
> + if (attr->disabled)
> + goto end;
> +
> + err = validate_hw_breakpoint(bp);

thre patch is mangled.. seems like you've lost all your tabs somehow

anyway, should you also do the release_bp_slot/reserve_bp_slot
magic to keep the slot accounting corrent?

jirka
