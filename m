From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Subject: Re: [PATCH bpf-next v3 3/8] bpf: add documentation for eBPF helpers
 (12-22)
Date: Wed, 18 Apr 2018 15:10:02 -0700
Message-ID: <20180418221000.e2gwl54kis2l4ia4@ast-mbp>
References: <20180417143438.7018-1-quentin.monnet@netronome.com>
 <20180417143438.7018-4-quentin.monnet@netronome.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <netdev-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180417143438.7018-4-quentin.monnet@netronome.com>
Sender: netdev-owner@vger.kernel.org
To: Quentin Monnet <quentin.monnet@netronome.com>
Cc: daniel@iogearbox.net, ast@kernel.org, netdev@vger.kernel.org, oss-drivers@netronome.com, linux-doc@vger.kernel.org, linux-man@vger.kernel.org
List-Id: linux-man@vger.kernel.org

On Tue, Apr 17, 2018 at 03:34:33PM +0100, Quentin Monnet wrote:
> Add documentation for eBPF helper functions to bpf.h user header file.
> This documentation can be parsed with the Python script provided in
> another commit of the patch series, in order to provide a RST document
> that can later be converted into a man page.
> 
> The objective is to make the documentation easily understandable and
> accessible to all eBPF developers, including beginners.
> 
> This patch contains descriptions for the following helper functions, all
> written by Alexei:
> 
> - bpf_get_current_pid_tgid()
> - bpf_get_current_uid_gid()
> - bpf_get_current_comm()
> - bpf_skb_vlan_push()
> - bpf_skb_vlan_pop()
> - bpf_skb_get_tunnel_key()
> - bpf_skb_set_tunnel_key()
> - bpf_redirect()
> - bpf_perf_event_output()
> - bpf_get_stackid()
> - bpf_get_current_task()
> 
> v3:
> - bpf_skb_get_tunnel_key(): Change and improve description and example.
> - bpf_redirect(): Improve description of BPF_F_INGRESS flag.
> - bpf_perf_event_output(): Fix first sentence of description. Delete
>   wrong statement on context being evaluated as a struct pt_reg. Remove
>   the long yet incomplete example.
> - bpf_get_stackid(): Add a note about PERF_MAX_STACK_DEPTH being
>   configurable.
> 
> Cc: Alexei Starovoitov <ast@kernel.org>
> Signed-off-by: Quentin Monnet <quentin.monnet@netronome.com>

looks great.
Acked-by: Alexei Starovoitov <ast@kernel.org>
