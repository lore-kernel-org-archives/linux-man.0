From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Subject: Re: [PATCH bpf-next v3 4/8] bpf: add documentation for eBPF helpers
 (23-32)
Date: Wed, 18 Apr 2018 15:11:57 -0700
Message-ID: <20180418221156.o5ulg2ecixr6oubn@ast-mbp>
References: <20180417143438.7018-1-quentin.monnet@netronome.com>
 <20180417143438.7018-5-quentin.monnet@netronome.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <netdev-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180417143438.7018-5-quentin.monnet@netronome.com>
Sender: netdev-owner@vger.kernel.org
To: Quentin Monnet <quentin.monnet@netronome.com>
Cc: daniel@iogearbox.net, ast@kernel.org, netdev@vger.kernel.org, oss-drivers@netronome.com, linux-doc@vger.kernel.org, linux-man@vger.kernel.org
List-Id: linux-man@vger.kernel.org

On Tue, Apr 17, 2018 at 03:34:34PM +0100, Quentin Monnet wrote:
> Add documentation for eBPF helper functions to bpf.h user header file.
> This documentation can be parsed with the Python script provided in
> another commit of the patch series, in order to provide a RST document
> that can later be converted into a man page.
> 
> The objective is to make the documentation easily understandable and
> accessible to all eBPF developers, including beginners.
> 
> This patch contains descriptions for the following helper functions, all
> written by Daniel:
> 
> - bpf_get_prandom_u32()
> - bpf_get_smp_processor_id()
> - bpf_get_cgroup_classid()
> - bpf_get_route_realm()
> - bpf_skb_load_bytes()
> - bpf_csum_diff()
> - bpf_skb_get_tunnel_opt()
> - bpf_skb_set_tunnel_opt()
> - bpf_skb_change_proto()
> - bpf_skb_change_type()
> 
> v3:
> - bpf_get_prandom_u32(): Fix helper name :(. Add description, including
>   a note on the internal random state.
> - bpf_get_smp_processor_id(): Add description, including a note on the
>   processor id remaining stable during program run.
> - bpf_get_cgroup_classid(): State that CONFIG_CGROUP_NET_CLASSID is
>   required to use the helper. Add a reference to related documentation.
>   State that placing a task in net_cls controller disables cgroup-bpf.
> - bpf_get_route_realm(): State that CONFIG_CGROUP_NET_CLASSID is
>   required to use this helper.
> - bpf_skb_load_bytes(): Fix comment on current use cases for the helper.
> 
> Cc: Daniel Borkmann <daniel@iogearbox.net>
> Signed-off-by: Quentin Monnet <quentin.monnet@netronome.com>

Acked-by: Alexei Starovoitov <ast@kernel.org>
