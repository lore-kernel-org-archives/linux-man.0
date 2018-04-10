From: Quentin Monnet <quentin.monnet@netronome.com>
Subject: Re: [RFC bpf-next] bpf: document eBPF helpers and add a script to
 generate man page
Date: Tue, 10 Apr 2018 11:21:04 +0100
Message-ID: <cf228f29-1d41-be4f-7b6b-b1c47ab9f4fa@netronome.com>
References: <20180406111122.11038-1-quentin.monnet@netronome.com>
 <05d2d03a-0b39-9d0c-9ba0-3461afc45fac@iogearbox.net>
 <16d4d67a-ab36-3e58-1082-52f0898546e5@netronome.com>
 <20180410014751.mqwqdyujvybir6g5@ast-mbp.dhcp.thefacebook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20180410014751.mqwqdyujvybir6g5@ast-mbp.dhcp.thefacebook.com>
Content-Language: en-US
Sender: netdev-owner@vger.kernel.org
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Cc: Daniel Borkmann <daniel@iogearbox.net>, ast@kernel.org, netdev@vger.kernel.org, oss-drivers@netronome.com, linux-doc@vger.kernel.org, linux-man@vger.kernel.org
List-Id: linux-man@vger.kernel.org

2018-04-09 18:47 UTC-0700 ~ Alexei Starovoitov
<alexei.starovoitov@gmail.com>
> On Mon, Apr 09, 2018 at 02:25:26PM +0100, Quentin Monnet wrote:
>>
>> Anyway, I am fine with keeping just signatures, descriptions and return
>> values for now. I will submit a new version with only those items.
> 
> Thank you.
> 
> Could you also split it into few patches?
>  include/uapi/linux/bpf.h   | 2237 ++++++++++++++++++++++++++++++++++++--------
>  scripts/bpf_helpers_doc.py |  568 +++++++++++
>  2 files changed, 2429 insertions(+), 376 deletions(-)
> 
> replying back and forth on a single patch of such size will be tedious
> for others to follow.
> May be document ~10 helpers at a time ? Total of ~7 patches and extra
> patch for .py ?
> 

Sure, I'll do that. And I'll try to group helpers in a patch by author,
it should also help for reviewing the descriptions.

Quentin
