From: Markus Heiser <markus.heiser@darmarit.de>
Subject: Re: [RFC bpf-next] bpf: document eBPF helpers and add a script to
 generate man page
Date: Mon, 9 Apr 2018 11:35:25 +0200
Message-ID: <C6491E01-3FC2-4AC4-8190-7B17CFAC01AD@darmarit.de>
References: <20180406111122.11038-1-quentin.monnet@netronome.com>
 <05d2d03a-0b39-9d0c-9ba0-3461afc45fac@iogearbox.net>
 <AB89F6E2-DE8A-4259-B361-BE96AD32E84E@darmarit.de>
 <81150b4e-79d5-f837-72bc-d988e87f842a@iogearbox.net>
Mime-Version: 1.0 (Mac OS X Mail 10.3 \(3273\))
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <81150b4e-79d5-f837-72bc-d988e87f842a@iogearbox.net>
Sender: netdev-owner@vger.kernel.org
To: Daniel Borkmann <daniel@iogearbox.net>
Cc: Jonathan Corbet <corbet@lwn.net>, Quentin Monnet <quentin.monnet@netronome.com>, ast@kernel.org, netdev@vger.kernel.org, oss-drivers@netronome.com, Linux Doc Mailing List <linux-doc@vger.kernel.org>, linux-man@vger.kernel.org
List-Id: linux-man@vger.kernel.org


> Am 09.04.2018 um 11:25 schrieb Daniel Borkmann <daniel@iogearbox.net>:
> 
> On 04/09/2018 11:21 AM, Markus Heiser wrote:
> [...]
>> Do we really need another kernel-doc parser?
>> 
>>  ./scripts/kernel-doc include/uapi/linux/bpf.h
>> 
>> should already do the job (producing .rst). For more infos, take a look at
> 
> This has absolutely zero to do with kernel-doc, but rather producing
> a description of BPF helper function that are later assembled into an
> actual man-page that BPF program developers (user space) can use.

May I completely misunderstood you, so correct my if I'am wrong:

- ./scripts/bpf_helpers_doc.py : produces reST markup from C-comments
- ./scripts/kerne-doc          : produces reST markup from C-comments

IMO: both are doing the same job, so why not using kernel-doc?

-- Markus --
