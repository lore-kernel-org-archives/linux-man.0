From: Quentin Monnet <quentin.monnet@netronome.com>
Subject: Re: [RFC bpf-next] bpf: document eBPF helpers and add a script to
 generate man page
Date: Mon, 9 Apr 2018 14:33:02 +0100
Message-ID: <c8715de7-674e-64e0-1e3b-4b4e884e80ad@netronome.com>
References: <20180406111122.11038-1-quentin.monnet@netronome.com>
 <05d2d03a-0b39-9d0c-9ba0-3461afc45fac@iogearbox.net>
 <AB89F6E2-DE8A-4259-B361-BE96AD32E84E@darmarit.de>
 <81150b4e-79d5-f837-72bc-d988e87f842a@iogearbox.net>
 <C6491E01-3FC2-4AC4-8190-7B17CFAC01AD@darmarit.de>
 <b2fbd09d-7ba2-9884-e18d-eac586af1665@iogearbox.net>
 <550CD0C6-10B5-4C8C-9C1E-70AA61ABDC34@darmarit.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <550CD0C6-10B5-4C8C-9C1E-70AA61ABDC34@darmarit.de>
Content-Language: en-US
Sender: netdev-owner@vger.kernel.org
To: Markus Heiser <markus.heiser@darmarit.de>, Daniel Borkmann <daniel@iogearbox.net>
Cc: Jonathan Corbet <corbet@lwn.net>, ast@kernel.org, netdev@vger.kernel.org, oss-drivers@netronome.com, Linux Doc Mailing List <linux-doc@vger.kernel.org>, linux-man@vger.kernel.org
List-Id: linux-man@vger.kernel.org

2018-04-09 12:52 UTC+0200 ~ Markus Heiser <markus.heiser@darmarit.de>
> 
>> Am 09.04.2018 um 12:08 schrieb Daniel Borkmann <daniel@iogearbox.net>:
> [...]
> 
>>> May I completely misunderstood you, so correct my if I'am wrong:
>>>
>>> - ./scripts/bpf_helpers_doc.py : produces reST markup from C-comments
>>> - ./scripts/kerne-doc          : produces reST markup from C-comments
>>>
>>> IMO: both are doing the same job, so why not using kernel-doc?
>>
>> They are not really doing the same job, in bpf_helpers_doc.py case you don't
>> want the whole header rendered, but just a fraction of it, that is, the
>> single big comment which describes all BPF helper functions that a BPF
>> program developer has available to use in user space - aka the entries in
>> the __BPF_FUNC_MAPPER() macro;
> 
> 
>> I also doubt the latter would actually qualify
>> in kdoc context as some sort of a function description.
> 
> latter .. ah, OK .. thanks for clarifying. 
> 
> -- Markus --

As Daniel explained, kernel-doc does not apply in this case, we do not
have the full function prototype for eBPF helpers in the header file.
But to be honest, I didn't even realise kernel-doc was available and
could do something close to what I was looking for, so thanks for your
feedback! :)

Quentin
