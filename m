From: Florian Weimer <fweimer@redhat.com>
Subject: Re: [PATCH 1/2] mount.2: document MS_REC and shared subtree flags
Date: Thu, 12 May 2016 10:36:00 +0200
Message-ID: <57344070.3020603@redhat.com>
References: <8896f51c3802ade59b398058c1d22c9830f9ae09.1463037379.git.osandov@fb.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-fsdevel-owner@vger.kernel.org>
In-Reply-To: <8896f51c3802ade59b398058c1d22c9830f9ae09.1463037379.git.osandov@fb.com>
Sender: linux-fsdevel-owner@vger.kernel.org
To: Omar Sandoval <osandov@osandov.com>, Michael Kerrisk <mtk.manpages@gmail.com>
Cc: linux-man@vger.kernel.org, linux-fsdevel@vger.kernel.org, Omar Sandoval <osandov@fb.com>
List-Id: linux-man@vger.kernel.org

On 05/12/2016 09:17 AM, Omar Sandoval wrote:
> +.BR MS_PRIVATE " (since Linux 2.6.15)"
> +Set the mount propagation on this mountpoint to private. Mounts will not
> +propagate to or from replicated subtrees.
> +When used, this must be the only flag in
> +.IR mountflags .

Is the last sentence actually true?  Further down, your patch mentions 
combining MS_PRIVATE with other flags.

Thanks,
Florian
