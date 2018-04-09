From: Markus Heiser <markus.heiser@darmarit.de>
Subject: Re: [RFC bpf-next] bpf: document eBPF helpers and add a script to
 generate man page
Date: Mon, 9 Apr 2018 11:26:51 +0200
Message-ID: <762ADA4F-40A3-4640-91A9-2969D5B7C6D2@darmarit.de>
References: <20180406111122.11038-1-quentin.monnet@netronome.com>
 <05d2d03a-0b39-9d0c-9ba0-3461afc45fac@iogearbox.net>
Mime-Version: 1.0 (Mac OS X Mail 10.3 \(3273\))
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <05d2d03a-0b39-9d0c-9ba0-3461afc45fac@iogearbox.net>
Sender: netdev-owner@vger.kernel.org
To: Daniel Borkmann <daniel@iogearbox.net>, Jonathan Corbet <corbet@lwn.net>
Cc: Quentin Monnet <quentin.monnet@netronome.com>, ast@kernel.org, netdev@vger.kernel.org, oss-drivers@netronome.com, Linux Doc Mailing List <linux-doc@vger.kernel.org>, linux-man@vger.kernel.org
List-Id: linux-man@vger.kernel.org

On 04/06/2018 01:11 PM, Quentin Monnet wrote:
>> eBPF helper functions can be called from within eBPF programs to perform
>> a variety of tasks that would be otherwise hard or impossible to do with
>> eBPF itself. There is a growing number of such helper functions in the
>> kernel, but documentation is scarce. The main user space header file
>> does contain a short commented description of most helpers, but it is
>> somewhat outdated and not complete. It is more a "cheat sheet" than a
>> real documentation accessible to new eBPF developers.
>> 
>> This commit attempts to improve the situation by replacing the existing
>> overview for the helpers with a more developed description. Furthermore,
>> a Python script is added to generate a manual page for eBPF helpers. The
>> workflow is the following, and requires the rst2man utility:
>> 
>>    $ ./scripts/bpf_helpers_doc.py \
>>            --filename include/uapi/linux/bpf.h > /tmp/bpf-helpers.rst
>>    $ rst2man /tmp/bpf-helpers.rst > /tmp/bpf-helpers.7
>>    $ man /tmp/bpf-helpers.7
>> 
>> The objective is to keep all documentation related to the helpers in a
>> single place,

Do we really need another kernel-doc parser?

  ./scripts/kernel-doc include/uapi/linux/bpf.h

should already do the job (producing .rst). For more infos, take a look at

  https://www.kernel.org/doc/html/latest/doc-guide/index.html

-- Markus --

PS: sorry for re-post, first post was HTML which is not accepted by ML :o
