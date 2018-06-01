From: Michal Hocko <mhocko@kernel.org>
Subject: Re: mlock() confusing 1 half of system RAM limit
Date: Fri, 1 Jun 2018 15:05:24 +0200
Message-ID: <20180601130524.GB15278@dhcp22.suse.cz>
References: <c43ad840-dcab-b86f-bf15-ffb26b66d37b@gblabs.co.uk>
 <20180601114425.GA15686@dhcp22.suse.cz>
 <3e33edd7-89dd-1c09-77df-a2ae23c208f1@gblabs.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <3e33edd7-89dd-1c09-77df-a2ae23c208f1@gblabs.co.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Alex Richman <alex.r@gblabs.co.uk>
Cc: linux-man@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-man@vger.kernel.org

On Fri 01-06-18 13:26:59, Alex Richman wrote:
> I am using a shm MAP_SHARED, along these lines:
> > shm_fd = shm_open(handle, (O_RDWR | O_CREAT), (S_IRWXU | S_IRWXG |
> S_IRWXO));
> > ftruncate(shm_fd, channel->sled_size)
> > channel->sled = mmap(NULL, channel->sled_size, (PROT_READ | PROT_WRITE),
> > (MAP_SHARED | MAP_NORESERVE), shm_fd, 0);
> > mlock(channel->sled, channel->sled_size) /* Fails with ENOMEM. */
> 
> But shmmax is unlimited on my box:
> # sysctl -a | grep shm
> kernel.shm_next_id = -1
> kernel.shm_rmid_forced = 0
> kernel.shmall = 18446744073692774399
> kernel.shmmax = 18446744073692774399
> kernel.shmmni = 4096
> 
> Any ideas?

shm_open uses tmpfs/shmem under the cover and that has the internal
limit as explained above.
-- 
Michal Hocko
SUSE Labs
