From: Jesper Dangaard Brouer <brouer@redhat.com>
Subject: Re: [PATCH bpf-next v3 8/8] bpf: add documentation for eBPF helpers
 (58-64)
Date: Wed, 18 Apr 2018 17:43:19 +0200
Message-ID: <20180418174319.37f6c793@redhat.com>
References: <20180417143438.7018-1-quentin.monnet@netronome.com>
        <20180417143438.7018-9-quentin.monnet@netronome.com>
        <20180418153448.574c6814@redhat.com>
        <67e84a95-5e7b-1c2c-e90f-7bcc0026bd10@netronome.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <67e84a95-5e7b-1c2c-e90f-7bcc0026bd10@netronome.com>
Sender: netdev-owner@vger.kernel.org
To: Quentin Monnet <quentin.monnet@netronome.com>
Cc: daniel@iogearbox.net, ast@kernel.org, netdev@vger.kernel.org, oss-drivers@netronome.com, linux-doc@vger.kernel.org, linux-man@vger.kernel.org, John Fastabend <john.fastabend@gmail.com>, brouer@redhat.com
List-Id: linux-man@vger.kernel.org

On Wed, 18 Apr 2018 15:09:41 +0100
Quentin Monnet <quentin.monnet@netronome.com> wrote:

> 2018-04-18 15:34 UTC+0200 ~ Jesper Dangaard Brouer <brouer@redhat.com>
> > On Tue, 17 Apr 2018 15:34:38 +0100
> > Quentin Monnet <quentin.monnet@netronome.com> wrote:
> >   
> >> diff --git a/include/uapi/linux/bpf.h b/include/uapi/linux/bpf.h
> >> index 350459c583de..3d329538498f 100644
> >> --- a/include/uapi/linux/bpf.h
> >> +++ b/include/uapi/linux/bpf.h
> >> @@ -1276,6 +1276,50 @@ union bpf_attr {
> >>   * 	Return
> >>   * 		0 on success, or a negative error in case of failure.
> >>   *
> >> + * int bpf_redirect_map(struct bpf_map *map, u32 key, u64 flags)
> >> + * 	Description
> >> + * 		Redirect the packet to the endpoint referenced by *map* at
> >> + * 		index *key*. Depending on its type, his *map* can contain  
> >                                                     ^^^
> > 
> > "his" -> "this"  
> 
> Thanks!
> 
> >> + * 		references to net devices (for forwarding packets through other
> >> + * 		ports), or to CPUs (for redirecting XDP frames to another CPU;
> >> + * 		but this is only implemented for native XDP (with driver
> >> + * 		support) as of this writing).
> >> + *
> >> + * 		All values for *flags* are reserved for future usage, and must
> >> + * 		be left at zero.
> >> + * 	Return
> >> + * 		**XDP_REDIRECT** on success, or **XDP_ABORT** on error.
> >> + *  
> > 
> > "XDP_ABORT" -> "XDP_ABORTED"  
> 
> Ouch. And I did the same for bpf_redirect(). Thanks for the catch.
> 
> > 
> > I don't know if it's worth mentioning in the doc/man-page; that for XDP
> > using bpf_redirect_map() is a HUGE performance advantage, compared to
> > the bpf_redirect() call ?  
> 
> It seems worth to me. How would you simply explain the reason for this
> difference?

The basic reason is "bulking effect", as devmap avoids the NIC
tailptr/doorbell update on every packet... how to write that in a doc
format?

I wrote about why XDP_REDIRECT with maps are smart here:
 http://vger.kernel.org/netconf2017_files/XDP_devel_update_NetConf2017_Seoul.pdf

Using maps for redirect, hopefully makes XDP_REDIRECT the last driver
XDP action code we need.  As new types of redirect can be introduced
without driver changes. See that AF_XDP also uses a map.

It is more subtle, but maps also function as a sorting step. Imagine
your XDP program need to redirect out different interfaces (or CPUs in
cpumap case), and packets arrive intermixed.  Packets get sorted into
the different map indexes, and the xdp_do_flush_map() will trigger the
flush operation.


Happened to have an i40e NIC benchmark setup, and ran a single flow pktgen test.

Results with 'xdp_redirect_map'
 13589297 pps (13,589,297) 

Results with 'xdp_redirect' NOT using devmap:
  7567575 pps (7,567,575)

Just to point out the performance benefit of devmap...

-- 
Best regards,
  Jesper Dangaard Brouer
  MSc.CS, Principal Kernel Engineer at Red Hat
  LinkedIn: http://www.linkedin.com/in/brouer
