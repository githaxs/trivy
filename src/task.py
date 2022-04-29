import os
from task_interfaces import StaticAnalysisTask, SubscriptionLevels


class Task(StaticAnalysisTask):
    """
    A simple and comprehensive vulnerability/misconfiguration scanner for containers and other artifacts.
    """

    name = "Trivy"
    subscription_level = SubscriptionLevels.ENTERPRISE
    source_script_path = "%s/task.sh" % os.path.dirname(__file__)