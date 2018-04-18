From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Subject: Re: [PATCH bpf-next v3 2/8] bpf: add documentation for eBPF helpers
 (01-11)
Date: Tue, 17 Apr 2018 18:04:50 -0700
Message-ID: <20180418010449.abxlxtdllo7nofg3@ast-mbp>
References: <20180417143438.7018-1-quentin.monnet@netronome.com>
 <20180417143438.7018-3-quentin.monnet@netronome.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <netdev-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180417143438.7018-3-quentin.monnet@netronome.com>
Sender: netdev-owner@vger.kernel.org
To: Quentin Monnet <quentin.monnet@netronome.com>
Cc: daniel@iogearbox.net, ast@kernel.org, netdev@vger.kernel.org, oss-drivers@netronome.com, linux-doc@vger.kernel.org, linux-man@vger.kernel.org
List-Id: linux-man@vger.kernel.org

On Tue, Apr 17, 2018 at 03:34:32PM +0100, Quentin Monnet wrote:
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
> - bpf_map_lookup_elem()
> - bpf_map_update_elem()
> - bpf_map_delete_elem()
> - bpf_probe_read()
> - bpf_ktime_get_ns()
> - bpf_trace_printk()
> - bpf_skb_store_bytes()
> - bpf_l3_csum_replace()
> - bpf_l4_csum_replace()
> - bpf_tail_call()
> - bpf_clone_redirect()
> 
> v3:
> - bpf_map_lookup_elem(): Fix description of restrictions for flags
>   related to the existence of the entry.
> - bpf_trace_printk(): State that trace_pipe can be configured. Fix
>   return value in case an unknown format specifier is met. Add a note on
>   kernel log notice when the helper is used. Edit example.
> - bpf_tail_call(): Improve comment on stack inheritance.
> - bpf_clone_redirect(): Improve description of BPF_F_INGRESS flag.
> 
> Cc: Alexei Starovoitov <ast@kernel.org>
> Signed-off-by: Quentin Monnet <quentin.monnet@netronome.com>

Acked-by: Alexei Starovoitov <ast@kernel.org>
