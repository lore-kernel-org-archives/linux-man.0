From: Alexei Starovoitov <ast-uqk4Ao+rVK5Wk0Htik3J/w@public.gmane.org>
Subject: Re: Draft 3 of bpf(2) man page for review
Date: Wed, 22 Jul 2015 15:12:05 -0700
Message-ID: <55B01535.4080809@plumgrid.com>
References: <55AFE46F.3090800@gmail.com> <55AFED75.2030208@plumgrid.com>
 <55AFF8BF.3050204@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <55AFF8BF.3050204-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Daniel Borkmann <daniel-FeC+5ew28dpmcu3hnIyYJQ@public.gmane.org>
Cc: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Silvan Jegen <s.jegen-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Walter Harms <wharms-fPG8STNUNVg@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On 7/22/15 1:10 PM, Michael Kerrisk (man-pages) wrote:
>         BPF  maps  are  a generic data structure for storage of diffe=
rent
>         data types.  A  user  process  can  create  multiple  maps  (=
with
>         key/value-pairs  being  opaque bytes of data) and access them=
 via
>         file descriptors.  Differnt eBPF programs  can  access  the  =
same
>         maps  in  parallel.  It's up to the user process and eBPF pro=
gram
>         to decide what they store inside maps.

typo in 'Different'

>     eBPF program types
>         By picking prog_type, the program author selects a set of  he=
lper
>         functions that can be called from the eBPF program and the co=
rre=E2=80=90
>         sponding format of struct bpf_context (which  is  the  data  =
blob
>         passed  into  the eBPF program as the first argument).  For e=
xam=E2=80=90
>         ple,     programs     loaded     with     a     prog_type    =
  of
>         BPF_PROG_TYPE_SOCKET_FILTER  may  call  the bpf_map_lookup_el=
em()
>         helper, whereas some other program  types  may  not  be  able=
  to
>         employ  this helper.  The set of functions available to eBPF =
pro=E2=80=90
>         grams of a given type may increase in the future.

overall it's all correct, but today bpf_map_lookup_elem() is allowed
for all program types. May be change that to:
"BPF_PROG_TYPE_KPROBE may call the bpf_probe_read() helper"
since only type_kprobe programs can call it.
type_sockets/type_sched_* cannot.

>                The bpf_context argument is a pointer to a struct sk_b=
uff.
>                Programs cannot access the fields of sk_buff directly.

Probably drop last sentence and replace 'sk_buff' with '__sk_buff'
in the first? Or for the first version we can drop both sentences.

The rest looks great. Thank you much!

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
